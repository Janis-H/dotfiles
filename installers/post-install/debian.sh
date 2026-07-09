#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/debian.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---

# --- Public entrypoint ---
run_os_post_install() {
    : # no os-specific yet
}
