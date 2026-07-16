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

# --- Repository Setup ---
setup_docker_repository() {
    : # TODO: add docker steps

    # NOTE: This function's setup already exists
    # in the `install_external_docker` function
    # of the `installers/external/debian.sh` file
}

setup_1password_repository() {
    : # TODO: add 1password steps
}

setup_package_repositories() {
    : # no functions as of yet

    setup_docker_repository
    setup_1password_repository
}

# --- Public entrypoint ---
install_system_packages() {
    setup_package_repositories

    run_cmd sudo apt-get update
    run_cmd sudo apt-get install -y "$@"
}
