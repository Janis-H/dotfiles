#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/arch.sh}"

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

# --- Public entrypoint ---
run_os_post_install() {
    print_next_steps
}
