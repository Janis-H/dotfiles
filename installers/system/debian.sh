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
