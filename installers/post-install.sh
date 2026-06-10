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

# --- Post Install Function ---
run_post_install() {
    info "\n\t--- Starting Post-Install ---\n"

    # script args
    use_omz=true

    # configuration
    set_default_shell_to_zsh

    # install plugins
    install_tmux_plugin_manager
    install_zsh_plugins "$use_omz"
}
