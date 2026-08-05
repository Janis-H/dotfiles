#!/usr/bin/env bash
# Defines shared external tool installers

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/common.sh}"

source "$DOTFILES_DIR/lib/install-or-update-repo.sh"

# --- Helpers ---
font_is_installed() {
    local font_name="$1"

    [[ -n "$(fc-list "$font_name" family)" ]]
}

# --- External functions ---

# Manages zsh-plugins
install_external_antidote() {
    install_or_update_repo \
        "https://github.com/mattmc3/antidote.git" \
        "${ZDOTDIR:-$HOME}/.antidote"
}

# Manual alternative to Antidote.
# To switch back, add "zsh_plugins" to the relevant EXTERNAL_CORE arrays
# and update .zshrc to source these plugins instead of loading Antidote.
# The cloned repos can coexist, but .zshrc should only load one set.
install_external_zsh_plugins() {
    local zsh_plugins_dir="$HOME/.zsh/plugins"

    info "Installing zsh plugins"

    run_cmd mkdir -p "$zsh_plugins_dir"

    install_or_update_repo \
        "https://github.com/zsh-users/zsh-autosuggestions" \
        "$zsh_plugins_dir/zsh-autosuggestions"

    install_or_update_repo \
        "https://github.com/zsh-users/zsh-syntax-highlighting.git" \
        "$zsh_plugins_dir/zsh-syntax-highlighting"

    install_or_update_repo \
        "https://github.com/Aloxaf/fzf-tab" \
        "$zsh_plugins_dir/fzf-tab"

    install_or_update_repo \
        "https://github.com/zsh-users/zsh-completions" \
        "$zsh_plugins_dir/zsh-completions"

    install_or_update_repo \
        "https://github.com/zsh-users/zsh-history-substring-search.git" \
        "$zsh_plugins_dir/zsh-history-substring-search"
}

install_external_autotiling() {
    if [[ "$OS" == "macos" ||  "$OS" == "debian" ]]; then
        info "Skipping external autotiling install"
        return 0
    fi

    info "Installing autotiling script (i3 and sway dependency)"

    run_cmd pip install autotiling
}

install_external_nerd_font() {
    local font_name="JuliaMono"
    local download_url="https://github.com/cormullion/juliamono/releases/latest/download/JuliaMono.zip"

    local fonts_folder="$HOME/.local/share/fonts"

    if font_is_installed "$font_name"; then
        info "$font_name is already installed"
        return 0
    else
        info "Installing $font_name font"
    fi

    run_cmd mkdir -p "$fonts_folder"

    # Download and extract
    run_cmd wget "$download_url"
    run_cmd unzip "$font_name.zip" -d "$fonts_folder/$font_name"

    # Rebuild font cache
    run_cmd fc-cache -fv

    # Verify Install
    if font_is_installed "$font_name"; then
        info "$font_name installed successfully"
    else
        error "Failed to install $font_name"
        return 1
    fi
}

install_external_herdr() {
    local install_url="https://herdr.dev/install.sh"

    info "Installing Herdr"

    if [[ "${DRY_RUN:-false}" == true ]]; then
        printf '+ curl -fsSL %q' "$install_url"
    fi

    run_cmd curl -fsSL "$install_url" | sh
}

install_external_oh_my_posh() {
    local install_url="https://ohmyposh.dev/install.sh"

    if is_command_available oh-my-posh; then
        info "oh-my-posh already installed"
        return 0
    fi

    info "Installing oh-my-posh"

    # NOTE:
    # Do not wrap this in run_cmd.
    # Dry run must be checked before the pipeline so curl does not run
    if [[ "${DRY_RUN:-false}" == true ]]; then
        printf '+ curl -fsSL %q | bash -s\n' "$install_url"
        return 0
    fi

    run_cmd curl -fsSL "$install_url" | bash -s
}

install_external_yazi() {
    if ! command -v cargo; then
        warn "Cargo is required to install Yazi"
        return 1
    fi

    if command -v yazi; then
        info "Yazi already installed"
        return
    fi

    info "Installing Yazi"
    run_cmd cargo install --force yazi-build
}

install_external_zen_browser() {
    info "Installing Zen Browser"
    run_cmd flatpak install --noninteractive --assumeyes flathub app.zen_browser.zen
}
