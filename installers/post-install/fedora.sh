#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/fedora.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---
setup_docker_non_root_access() {
    local target_user="${SUDO_USER:-$USER}"

    if [[ "$target_user" == root ]]; then
        error "Cannot determine the non-root user for Docker access"
        return 1
    fi

    info "Configuring Docker access $target_user"

    run_cmd sudo groupadd -f docker
    run_cmd sudo usermod -aG docker "$target_user"

    info "Log out and back in for Docker group membership to take effect"
}

# --- Next steps ---
print_next_steps() {
    section "Next steps"

    cat <<EOF
    - Log out and back in as $USER to use Docker without sudo
EOF
}

# --- Public entrypoint ---
run_os_post_install() {
    setup_docker_non_root_access

    print_next_steps
}
