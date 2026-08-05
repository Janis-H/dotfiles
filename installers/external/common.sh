#!/usr/bin/env bash
# Defines shared external tool installers

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/common.sh}"

source "$DOTFILES_DIR/lib/install-or-update-repo.sh"

# --- Helpers ---
font_is_installed() {
    local font_name="$1"

    [[ -n "$(fc-list "$font_name" family)" ]]
}

install_external_font() (
    local file_name="$1"
    local font_name="$2"
    local download_url="$3"

    local fonts_folder="$HOME/.local/share/fonts"
    local install_folder="$fonts_folder/$font_name"
    local tmp_dir
    local download_path

    if font_is_installed "$font_name"; then
        info "$font_name is already installed"
        return 0
    fi

    info "Installing $font_name font"

    # Setup temp download directory
    tmp_dir="$(mktemp -d)" || {
        error "Failed to create temporary directory"
        return 1
    }

    trap 'rm -rf -- "$tmp_dir"' EXIT

    download_path="$tmp_dir/$file_name"

    run_cmd mkdir -p "$tmp_dir/$file_name" || return 1

    # Download and extract
    run_cmd wget -P "$download_path" "$download_url" || return 1
    run_cmd 7z x "$tmp_dir/$file_name" -o "$install_folder" || reutrn 1

    # Rebuild font cache
    run_cmd fc-cache -fv || return 1

    # Commands are intentionally skipped during dry runs
    if [[ "${DRY_RUN:-false}" == true ]]; then
        return 0
    fi

    # Verify Install
    if font_is_installed "$font_name"; then
        info "$font_name installed successfully"
    else
        error "Failed to install $font_name"
        return 1
    fi
)

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
    if [[ "$OS" == "macos" ]]; then
        info "Skipping external autotiling install"
        return 0
    fi

    info "Installing autotiling script (i3 and sway dependency)"

    if [[ "$OS" == "debian" ]]; then
        run_cmd pipx install autotiling
        return 0
    fi

    run_cmd pip install autotiling
}

install_external_julia_mono_font() {
    local file_name="JuliaMono.zip"
    local font_name="JuliaMono"
    local download_url="https://github.com/cormullion/juliamono/releases/latest/download/JuliaMono.zip"

    install_external_font "$file_name" "$font_name" "$download_url"
}

install_external_herdr() {
    local install_url="https://herdr.dev/install.sh"

    info "Installing Herdr"

    if [[ "${DRY_RUN:-false}" == true ]]; then
        printf '+ curl -fsSL %q | sh' "$install_url"
        return 0
    fi

    printf '+ curl -fsSL %q | sh' "$install_url"
    curl -fsSL "$install_url" | sh
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

    printf '+ curl -fsSL %q | bash -s\n' "$install_url"
    curl -fsSL "$install_url" | bash -s
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
