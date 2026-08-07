#!/usr/bin/env bash
# Defines Debian-family package installtion logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing debian.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- APT helpers ---
is_system_package_installed() {
    dpkg -s "$1" &>/dev/null
}

is_repository_configured() {
    local repo="$1"

    if grep -qsF -- "$repo" /etc/apt/sources.list 2>/dev/null ||
        grep -RqsF \
        --include='*.list' \
        --include='*.sources' \
        -- "$repo" /etc/apt/sources.list.d; then
    info "$repo repository is already configured"
    fi
}

is_in_packages_list() {
    local target_package="$1"
    shift

    local packages_list=("$@")

    local is_in_list=false

    for pkg in "${packages_list[@]}"; do
        if [[ "$pkg" = "$target_package" ]]; then
            is_in_list=true
        fi
    done

    if ! "$is_in_list"; then
        info "Skipping $target_package repository setup"
    fi
}

# --- Repository Setup ---
setup_1password_repository() {
    local pkg="1password"
    local repo="1password"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$repo"; then
        return 0
    fi

    local key_url="https://downloads.1password.com/linux/keys/1password.asc"
    local policy_url="https://downloads.1password.com/linux/debian/debsig/1password.pol"
    local policy_id="AC2D62742012EA22"
    local key_file

    if [[ "${DRY_RUN:-false}" == true ]]; then
        key_file="${TMPDIR:-/tmp}/1password-key.XXXXXX.asc"
    else
        key_file="$(mktemp "${TMPDIR:-/tmp}/1password-key.XXXXXX.asc")"
        trap 'rm -f -- "$key_file"' EXIT
    fi

    info "Configuring 1Password repository"

    run_cmd curl -fsSL \
        "$key_url" \
        -o "$key_file"

    run_cmd sudo install -d -m 0755 \
        /usr/share/keyrings \
        "/etc/debsig/policies/$policy_id" \
        "/usr/share/debsig/keyrings/$policy_id"

    run_cmd sudo gpg --dearmor --yes \
        --output /usr/share/keyrings/1password-archive-keyring.gpg \
        "$key_file"

    run_cmd sudo tee /etc/apt/sources.list.d/1password.list >/dev/null <<EOF
    deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main
EOF

run_cmd sudo curl -fsSL \
    "$policy_url" \
    -o "/etc/debsig/policies/$policy_id/1password.pol"

run_cmd sudo gpg --dearmor --yes \
    --output "/usr/share/debsig/keyrings/$policy_id/debsig.gpg" \
    "$key_file"
}

setup_docker_repository() {
    local pkg="docker-ce"
    local repo="docker"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$repo"; then
        return 0
    fi

    info "Configuring Docker repository"

    # Add Docker's official GPG key:
    run_cmd sudo apt update
    run_cmd sudo apt install ca-certificates curl
    run_cmd sudo install -m 0755 -d /etc/apt/keyrings
    run_cmd sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    run_cmd sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    run_cmd sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
    Types: deb
    URIs: https://download.docker.com/linux/ubuntu
    Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
    Components: stable
    Architectures: $(dpkg --print-architecture)
    Signed-By: /etc/apt/keyrings/docker.asc
EOF

    run_cmd sudo apt update
}

setup_helium_browser_repository() {
    local pkg="helium-bin"
    local repo="helium"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$repo"; then
        return 0
    fi

    info "Configuring Helium Browser repository"

    local signing_key="https://raw.githubusercontent.com/imputnet/helium-linux/main/pubkey.asc"

    if [[ "${DRY_RUN:-false}" == true ]]; then
        printf '+ curl -fsSL %q | sudo gpg --dearmor -o /usr/share/keyrings' "$signing_key"
        printf '+ echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/helium.gpg] https://pkg.helium.computer/deb stable main" | sudo tee /etc/apt/sources.list.d/helium.list'
    fi

    curl -fsSL "$signing_key" | sudo gpg --dearmor -o /usr/share/keyrings/helium.gpg
    echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/helium.gpg] https://pkg.helium.computer/deb stable main" | sudo tee /etc/apt/sources.list.d/helium.list
}

setup_package_repositories() {
    setup_1password_repository "$@"
    setup_docker_repository "$@"
    setup_helium_browser_repository "$@"
}

# --- Public entrypoint ---
install_system_packages() {
    local packages=("$@")

    setup_package_repositories "${packages[@]}"

    info "Installing system packages"
    run_cmd sudo apt-get update
    run_cmd sudo apt-get install -y "${packages[@]}"
}
