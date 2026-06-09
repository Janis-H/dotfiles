#!/usr/bin/env bash
# Defines shared post-install setup after package and external tool installation

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install.sh}"

# --- Source helper functions ---
source "$DOTFILES_DIR/lib/log.sh"

# --- Setup functions ---
set_default_shell_to_zsh() {
    if [[ "$SHELL" == "$(command -v zsh)" ]]; then
        info "Default shell already set to zsh"
        return 0
    fi

    info "Setting default shell to zsh"

    chsh -s "$(command -v zsh)"
}

install_zsh_plugins() {
    local zsh_plugins_dir="$HOME/.zsh/plugins"

    mkdir -p "$zsh_plugins_dir"

    if [[ ! -d "$zsh_plugins_dir/zsh-autosuggestions" ]]; then
        info "Installing zsh-autosuggestions"

        git clone https://github.com/zsh-users/zsh-autosuggestions \
            "$zsh_plugins_dir/zsh-autosuggestions"
    fi

    if [[ ! -d "$zsh_plugins_dir/zsh-syntax-highlighting" ]]; then
        info "Installing zsh-syntax-highlighting"

        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$zsh_plugins_dir/zsh-syntax-highlighting"
    fi
}

install_tmux_plugins() {
    local tmux_plugins_dir="$HOME/.tmux/plugins"

    mkdir -p "$tmux_plugins_dir"

    # install tmux plugin manager
    if [[ ! -d "$tmux_plugins_dir/tpm" ]]; then
        info "Installing tmux plugin manager"

        git clone https://github.com/tmux-plugins/tpm \
            "$tmux_plugins/tpm"
    fi

    # install vim-tmux-navigator
    if [[ ! -d "$tmux_plugins_dir/vim-tmux-navigator" ]]; then
        info "Installing vim tmux navigator"

        git clone git@github.com:christoomey/vim-tmux-navigator.git \
            "$tmux_plugins/vim-tmux-navigator"
    fi
}

# --- Post Install Function ---
run_post_install() {
    # configuration
    set_default_shell_to_zsh

    # install plugins
    install_tmux_plugins
    install_zsh_plugins
}
