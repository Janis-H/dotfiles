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

# --- Repository Setup ---
setup_docker_repository() {
    info "Configuring Docker repository"

    run_cmd sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
}

setup_helium_browser_repository() {
    info "Configuring Helium Browser repository"

    run_cmd sudo dnf copr enable input/helium
}

setup_package_repositories() {
    setup_docker_repository
}

# --- Public entrypoint ---
install_system_packages() {
    setup_package_repositories

    info "Installing system packages"
    run_cmd sudo dnf install -y "$@"
}
