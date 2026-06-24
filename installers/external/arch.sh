#!/usr/bin/env bash
# Defines Arch-family external tool installs not handled by pacman

# -- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External installers ---

# --- Wrapper ---
install_external_tools() {
    # add functions here
    true
}
