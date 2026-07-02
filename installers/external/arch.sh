#!/usr/bin/env bash
# Defines Arch-family external tool installs not handled by pacman

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/arch.sh"

# --- Sources ---

# --- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External tool installers ---

# --- Public entrypoint ---
install_external_tools() {
    : # nothing distro-specific yet
}
