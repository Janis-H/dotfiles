#!/usr/bin/env bash
# Defines Arch-family package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/arch.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Pacman helpers ---
is_system_package_installed() {
    pacman -Qi "$1" &>/dev/null
}

# --- Public entrypoint ---
install_system_packages() {
    info "Installing system packages"
    run_cmd sudo pacman -Sy --needed "$@"
}
