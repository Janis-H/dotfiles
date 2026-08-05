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

    repo_dirs=(
        /etc/yum.repos.d
        /etc/distro.repos.d
        /usr/share/dnf5/repos.d
    )

    if grep -RqsF \
        --include='*.repo' \
        -- "$repo" "${repo_dirs[@]}"; then
    info "$repo repository is already configured"
    fi
}

# --- repository setup ---
setup_docker_repository() {
    if is_repository_configured "docker"; then
        return 0
    fi

    info "configuring docker repository"

    run_cmd sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
}

setup_1password_repository() {
    if is_repository_configured "1password"; then
        return 0
    fi

    info "configuring 1password repository"

    run_cmd sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    run_cmd sudo sh -c 'echo -e "[1password]\nname=1password stable channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
}

setup_helium_browser_repository() {
    if is_repository_configured "helium"; then
        return 0
    fi

    info "configuring helium browser repository"

    run_cmd sudo dnf copr enable imput/helium
}

setup_ghostty_repository() {
    if is_repository_configured "ghostty"; then
        return 0
    fi

    info "configuring ghostty repository"

    run_cmd sudo dnf copr enable scottames/ghostty
}

setup_package_repositories() {
    setup_docker_repository
    setup_1password_repository
    setup_helium_browser_repository
    setup_ghostty_repository
}

# --- public entrypoint ---
install_system_packages() {
    # todo: uncomment below once a check
    # setup_package_repositories

    info "installing system packages"
    run_cmd sudo dnf install -y "$@" --skip-broken
}
