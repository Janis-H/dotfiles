#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/common.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/install-or-update-repo.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helpers ---
gsettings_key_exists() {
    local schema="$1"
    local key="$2"

    command -v gsettings >/dev/null 2>&1 &&
        gsettings list-schemas | grep -Fxq "$schema" &&
        gsettings list-keys "$schema" | grep -Fxq "$key"
}

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

    run_cmd chsh -s "$(command -v zsh)"
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
    local tmux_plugins_dir="$HOME/.tmux/plugins"
    local installer="$tmux_plugins_dir/tpm/bin/install_plugins"

    if [[ ! -x "$installer" ]]; then
        warn "TPM installer not found, skipping tmux plugin install"
        return 0
    fi

    info "Installing tmux plugins"

    # check if script is already running in an active tmux session
    local in_tmux=false
    if [[ -n "$TMUX" ]]; then
        in_tmux=true
    else
        # if not inside tmux, start a background instance safely
        tmux start-server
    fi

    # source configuration to map the plugins
    local tmux_conf="$HOME/.tmux.conf"
    [[ ! -f "$tmux_conf" && -f "$HOME/.config/tmux/tmux.conf" ]] && tmux_conf="$HOME/.config/tmux/tmux.conf"
    if [[ -f "$tmux_conf" ]]; then
        tmux source-file "$tmux_conf"
    fi

    # explicitly require path variable required by TPM
    export TMUX_PLUGIN_MANAGER_PATH="$tmux_plugins_dir"

    run_cmd "$installer"

    # SAFE CLEANUP: only kill the server if your script created it
    # If $in_tmux is true, we leave the server completely untouched!
    if [[ "$in_tmux" == false ]]; then
        tmux kill-server >/dev/null 2>&1 || true
    fi
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
}
