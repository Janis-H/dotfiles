#!/usr/bin/env bash
# Defines Arch-family external tool installs not handled by pacman

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/arch.sh"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External tool installers ---
install_external_yazi() {
    if ! command -v cargo; then
        error "Cargo is required to install Yazi"
        return 1
    fi

    run_cmd cargo install --force yazi-build
}
