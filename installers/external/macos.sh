#!/usr/bin/env bash
# Defines macOS external tool installs not handled by Homebrew

# -- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External installers ---
install_oh_my_zsh() {
    if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
        info "Oh My Zsh is installed"
        return
    fi

    info "Installing oh-my-zsh"

    # install oh-my-zsh via curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# --- Wrapper ---
install_external_tools() {
    # not available in homebrew
    install_oh_my_zsh
}
