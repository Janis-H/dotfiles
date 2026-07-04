#!/usr/bin/env bash
# Defines macOS external tool installs not handled by Homebrew

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/macos.sh"

# --- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External tool installers ---
