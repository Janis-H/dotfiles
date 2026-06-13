#!/usr/bin/env bash
# Defines shared post-install setup after package and external tool installation

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/post-install.sh}"

# --- Source helper functions ---
source "$DOTFILES_DIR/lib/log.sh"

# --- Setup functions ---
create_dev_dirs() {
    mkdir -p "$HOME/dev"
    mkdir -p "$HOME/dev/scripts"
    mkdir -p "$HOME/.local/bin"
    mkdir -p "$HOME/.config"
}

setup_local_bin() {
    mkdir -p "$HOME/.local/bin"

    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        info "$HOME/.local/bin is not currently in PATH"
        info "Make sure your shell config adds it"
    fi
}

set_default_shell() {
    if [[ "$SHELL" == "$(command -v zsh)" ]]; then
        info "Default shell already set to zsh"
        return 0
    fi

    info "Setting default shell to zsh"

    chsh -s "$(command -v zsh)"
}

setup_fzf() {
    if ! command -v fzf &>/dev/null; then
        info "fzf is not installed, skipping"
        return
    fi

    info "fzf installed"

    # fzf shell integration should be handled by .zshrc.
    # This function only exists as a post-install sanity check.

    if fzf --zsh &>/dev/null; then
        info "fzf installed with built-in zsh integration"
        return
    fi

    info "fzf installed, but fzf --zsh is not supported"
    info "Make sure .zshrc has fallback paths for fzf keybindings/completion"
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

install_tmux_plugins_from_config() {
    local installer="$HOME/.tmux/plugins/tpm/bin/install_plugins"

    if [[ ! -x "$installer" ]]; then
        info "TPM installer not found, skipping tmux plugin install"
        return
    fi

    info "Installing tmux plugins"
    "$installer"
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

    # function args
    use_omz=true

    # prepare directories
    create_dev_dirs
    setup_local_bin

    # configure shell and terminal workflow
    set_default_shell
    install_zsh_plugins "$use_omz"
    install_tmux_plugin_manager
    install_tmux_plugins_from_config

    # configure dev tools
    setup_fzf
    setup_git_defaults

    # TODO: add check for missing tools
    # TODO: consider adding a check script as a dotfiles directory sanity check
}
