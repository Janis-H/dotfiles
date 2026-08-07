#!/usr/bin/env bash
# Defines Fedora-family package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/fedora.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Fedora package helpers ---
is_system_package_installed() {
    rpm -q "$1" &>/dev/null
}

is_repository_configured() {
    local repo="$1"

    repos_dir="/etc/yum.repos.d"

    if grep -RqsF \
        --include='*.repo' \
        -- "$repo" "$repos_dir"; then
    info "$repo repository is already configured"
    fi
}

is_in_package_list() {
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
        info "Skipping $target_package repo setup"
    fi
}

# --- repository setup ---
setup_docker_repository() {
    local pkg="docker"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$pkg"; then
        return 0
    fi

    info "configuring $pkg repository"

    run_cmd sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
}

setup_1password_repository() {
    local pkg="1password"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$pkg"; then
        return 0
    fi

    info "configuring $pkg repository"

    run_cmd sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    run_cmd sudo sh -c 'echo -e "[1password]\nname=1password stable channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
}

setup_helium_browser_repository() {
    local pkg="helium-bin"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$pkg"; then
        return 0
    fi

    info "configuring $pkg repository"

    run_cmd sudo dnf copr enable imput/helium
}

setup_ghostty_repository() {
    local pkg="ghostty"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$pkg"; then
        return 0
    fi

    info "configuring $pkg repository"

    run_cmd sudo dnf copr enable scottames/ghostty
}

setup_swayfx_repository() {
    local pkg="swayfx"

    if ! is_in_packages_list "$pkg" "$@" || is_repository_configured "$pkg"; then
        return 0
    fi

    info "Configuring $pkg repository"

    run_cmd sudo dnf copr enable -y swayfx/swayfx
}

setup_package_repositories() {
    info "Configuring package repositories"

    setup_1password_repository "$@"
    setup_docker_repository "$@"
    setup_ghostty_repository "$@"
    setup_helium_browser_repository "$@"
    setup_swayfx_repository "$@"
}

# --- public entrypoint ---
install_system_packages() {
    local packages=("$@")

    setup_package_repositories "${packages[@]}"

    info "installing system packages"
    run_cmd sudo dnf install -y "${packages[@]}" --skip-broken
}
