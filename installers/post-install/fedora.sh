#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/fedora.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---

# --- Next steps ---
print_next_steps() {
    section "Next steps"

    cat <<EOF
    - Log out and back in as $USER to use Docker without sudo
EOF
}

configure_dms() {
    if ! command -v niri || ! command -v dms &>dev/null; then
        info "Skipping DMS configuration: Niri or DMS is not installed"
        return 0
    fi

    info "Configuring DMS to start with Niri"

    run_cmd systemctl --user add-wants niri.service dms
}

# --- Public entrypoint ---
run_os_post_install() {
    configure_dms

    print_next_steps
}
