#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/arch.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

setup_docker_non_root_access() {
    info "Configuring Docker for non-root access"

    run_cmd sudo groupadd -f docker
    run_cmd sudo usermod -aG docker "$USER"

    info "Log out and back in for Docker group membership to take effect"
}

# --- Public entrypoint ---
run_os_post_install() {
    setup_docker_non_root_access
}
