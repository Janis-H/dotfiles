#!/usr/bin/env bash
# Defines Fedora-family package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/fedora.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Fedora package helpers ---
is_system_package_installed() {
    rpm -q "$1" &>/dev/null
}

# --- Public entrypoint ---
install_system_packages() {
    info "Installing system packages"
    run_cmd sudo dnf install -y "$@"
}
