#!/usr/bin/env bash
# Defines shared post-install setup after package and external tool installation

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install.sh}"

# --- Source helper functions ---
source "$DOTFILES_DIR/lib/log.sh"

# --- Setup functions ---
create_dev_dirs() {
    mkdir -p "$HOME/dev"
    mkdir -p "$HOME/dev/scripts"
    mkdir -p "$HOME/.local/bin"
}

set_default_shell() {
    if [[ "$SHELL" == "$(command -v zsh)" ]]; then
        info "Default shell already set to zsh"
        return 0
    fi

    info "Setting default shell to zsh"

    chsh -s "$(command -v zsh)"
}

install_zsh_plugins() {
    local use_omz="$1"

    if [[ "$use_omz" = true ]]; then
        local zsh_plugins_dir="$HOME/.oh-my-zsh/plugins"
    else
        local zsh_plugins_dir="$HOME/.zsh/plugins"
    fi

    mkdir -p "$zsh_plugins_dir"

    # Install zsh-autosuggestions
    if [[ ! -d "$zsh_plugins_dir/zsh-autosuggestions" ]]; then
        info "Installing zsh-autosuggestions"

        git clone https://github.com/zsh-users/zsh-autosuggestions \
            "$zsh_plugins_dir/zsh-autosuggestions"
    else
        info "zsh-autosuggestions already installed"
    fi

    # Install zsh-syntax-highlighting
    if [[ ! -d "$zsh_plugins_dir/zsh-syntax-highlighting" ]]; then
        info "Installing zsh-syntax-highlighting"

        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "$zsh_plugins_dir/zsh-syntax-highlighting"
    else
        info "zsh-syntax-highlighting already installed"
    fi
}

install_tmux_plugin_manager() {
    local tmux_plugins_dir="$HOME/.tmux/plugins"

    mkdir -p "$tmux_plugins_dir"

    # Install tmux plugin manager
    if [[ ! -d "$tmux_plugins_dir/tpm" ]]; then
        info "Installing tmux plugin manager"

        git clone https://github.com/tmux-plugins/tpm \
            "$tmux_plugins_dir/tpm"
    else
        info "tmux plugin manager already installed"
    fi
}

setup_git_defaults() {
    git config --global init.defaultBranch main
    git config --global core.editor nvim
    git config --global push.autoSetupRemote true
    git config --global fetch.prune true

    git config --global diff.coloredMoved zebra
}

# --- Post Install Function ---
run_post_install() {
    info "\n\t--- Starting Post-Install ---\n"

    # script args
    use_omz=true

    # prepare directories
    create_dev_dirs

    # configuration
    set_default_shell
    setup_git_defaults

    # install plugins
    install_tmux_plugin_manager
    install_zsh_plugins "$use_omz"

}
