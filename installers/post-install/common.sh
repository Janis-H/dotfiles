#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/common.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/install-or-update-repo.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---
create_dev_dirs() {
    info "Creating dev dirs"

    run_cmd mkdir -p "$HOME/dev/archived"
    run_cmd mkdir -p "$HOME/dev/coursework"
    run_cmd mkdir -p "$HOME/dev/notes"
    run_cmd mkdir -p "$HOME/dev/personal"
    run_cmd mkdir -p "$HOME/dev/work"
    run_cmd mkdir -p "$HOME/dev/tools"

    run_cmd mkdir -p "$HOME/dev/scripts/archived"
    run_cmd mkdir -p "$HOME/dev/scripts/bin"
    run_cmd mkdir -p "$HOME/dev/scripts/lib"

    run_cmd mkdir -p "$HOME/.config"
    run_cmd mkdir -p "$HOME/.local/bin"
}

setup_docker_non_root_access() {
   if [[ "$(uname -s)" != "Linux" ]]; then
        return 0
    fi

    local target_user="${SUDO_USER:-$USER}"

    info "Configuring Docker for non-root access"

    run_cmd sudo groupadd -f docker
    run_cmd sudo usermod -aG docker "$target_user"

    info "Log out and back in for Docker group membership to take effect"
}

setup_flathub() {
    if [[ "$(uname -s)" != "Linux" ]]; then
        return 0
    fi

    info "Configuring Flathub repository"

    # During dry-run, Flatpak may not exist yet because package installation
    # commands were only printed.
    if [[ "${DRY_RUN:-false}" != true ]] && ! command -v flatpak >/dev/null 2>&1; then
        warn "Flatpak is not installed; skipping Flathub setup"
        return 0
    fi

    run_cmd sudo flatpak remote-add \
        --if-not-exists \
        flathub \
        https://dl.flathub.org/repo/flathub.flatpakrepo
}


setup_local_bin() {
    info "Setting up .local/bin"
    run_cmd mkdir -p "$HOME/.local/bin"

    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        warn "$HOME/.local/bin is not currently in PATH"
        warn "Make sure your shell config adds it"
    fi
}

set_default_shell() {
    if [[ "$SHELL" == "$(command -v zsh)" ]]; then
        info "Default shell already set to zsh"
        return 0
    fi

    info "Setting default shell to zsh"

    # NOTE:
    # Do not use run_cmd here
    # Dry-run is checked before command substitution so curl does not run during dry-run.
    if [[ "${DRY_RUN:-false}" == true ]]; then
        # shellcheck disable=SC2016
        printf '+ chsh -s "$(command -v zsh)"\n'
        return 0
    fi

    chsh -s "$(command -v zsh)"
}

verify_fzf() {
    if ! command -v fzf &>/dev/null; then
        info "fzf is not installed, skipping"
        return 0
    fi

    info "fzf installed"

    # fzf shell integration should be handled by .zshrc.
    # This function only exists as a post-install sanity check.

    if fzf --zsh &>/dev/null; then
        info "fzf installed with built-in zsh integration"
        return 0
    fi

    warn "fzf installed, but fzf --zsh is not supported"
    warn "Make sure .zshrc has fallback paths for fzf keybindings/completion"
}

install_tmux_plugin_manager() {
    local tmux_plugins_dir="$HOME/.tmux/plugins"

    info "Creating tmux plugins dir"

    run_cmd mkdir -p "$tmux_plugins_dir"

    if [[ ! -d "$tmux_plugins_dir/tpm" ]]; then
        info "Installing tmux plugin manager"

        run_cmd git clone https://github.com/tmux-plugins/tpm \
            "$tmux_plugins_dir/tpm"
    else
        info "tmux plugin manager already installed"
    fi
}

install_tmux_plugins_from_config() {
    local installer="$HOME/.tmux/plugins/tpm/bin/install_plugins"

    if [[ ! -x "$installer" ]]; then
        warn "TPM installer not found, skipping tmux plugin install"
        return 0
    fi

    info "Installing tmux plugins"
    run_cmd "$installer"
}

setup_git_defaults() {
    info "Setting git defaults"

    run_cmd git config --global init.defaultBranch main
    run_cmd git config --global core.editor nvim
    run_cmd git config --global push.autoSetupRemote true
    run_cmd git config --global fetch.prune true

    run_cmd git config --global diff.coloredMoved zebra
}

# --- Public entrypoint ---
run_common_post_install() {
    create_dev_dirs
    setup_local_bin

    set_default_shell
    install_tmux_plugin_manager
    install_tmux_plugins_from_config

    verify_fzf
    setup_git_defaults
    setup_docker_non_root_access
    setup_flathub
}
