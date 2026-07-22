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
install_external_resvg() {
    if is_command_available resvg; then
        info "resvg already installed"
        return 0
    fi

    if ! is_command_available cargo; then
        info "Cargo is required to install resvg"
        return 0
    fi

    info "Installing resvg"
    run_cmd cargo install resvg --locked
}

install_external_lazydocker() {
    info "Installing or Updating lazydocker"
    run_cmd go install github.com/jesseduffield/lazydocker@latest
}

install_external_lazygit() {
    info "Installing or updating lazygit"
    run_cmd go install github.com/jesseduffield/lazygit@latest
}
