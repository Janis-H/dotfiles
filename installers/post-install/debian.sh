#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/debian.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---
setup_docker_non_root_access() {
    info "Configuring Docker for non-root access"

    run_cmd sudo groupadd -f docker
    run_cmd sudo usermod -aG docker "$USER"

    info "Log out and back in for Docker group membership to take effect"
}

# TODO: Inspect upstream `configure.sh`. Check TODO.md for more details
configure_rodecaster_pipewire() {
    warn "Skipping configure_rodecaster_pipewire until upstream script has been verified"
    return 0

    # install_url="https://parzival-space.github.io/rodecaster-pro-2-virtual-devices-pipewire/configure.sh"

    # info "Configuring Rodecaster Pro 2 / Rodecaseter Duo"

    # # NOTE:
    # # Do not use run_cmd here
    # # Dry-run is checked before this pipeline so curl does not run
    # if [[ "${DRY_RUN:-false}" == true ]]; then
    #     # shellcheck disable=SC2016
    #     printf '+ curl -sfL %q | sh -s - --install\n' "$install_url"
    #     return 0
    # fi

    # # NOTE: installer detects the connected device automatically and selects the matching template for supported Pro II and Duo models.
    # curl -sfL "$install_url" | sh -s - --install
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
    configure_rodecaster_pipewire
    setup_docker_non_root_access

    print_next_steps
}
