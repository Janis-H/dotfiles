#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/macos.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---

# --- Next steps ---
print_next_steps() {
    info "Next steps:"
    info "  - Restart your terminal"
}

# --- Public entrypoint ---
run_os_post_install() {
    print_next_steps
}
