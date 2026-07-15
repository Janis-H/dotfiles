#!/usr/bin/env bash
# Defines Debian-family package installtion logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing debian.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- APT helpers ---
is_system_package_installed() {
    dpkg -s "$1" &>/dev/null
}

# --- Public entrypoint ---
install_system_packages() {
    run_cmd sudo apt-get update
    run_cmd sudo apt-get install -y "$@"
}
