#!/usr/bin/env bash
# Defines shared external tool installers

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/common.sh}"

source "$DOTFILES_DIR/lib/install-or-update-repo.sh"

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

install_external_rust() {
    local rustup_url="https://sh.rustup.rs"

    if command -v rustc &>/dev/null || command -v cargo &>/dev/null; then
        warn "A system-managed Rust toolchain is installed; installing rustup-managed Rust"
    fi

    if command -v rustup &>/dev/null; then
        info "Updating Rust stable toolchain"
        run_cmd rustup update stable
        run_cmd rustup default stable
        return
    fi

    info "Installing Rust and Cargo through rustup"

    if [[ "${DRY_RUN:-false}" = true ]]; then
        printf '%s\n' \
            "+ curl --proto '=https' --tlsv1.2 -sSf $rustup_url  | sh -s -- -y --profile minimal --default-toolchain stable"
        return
    fi

    curl --proto '=https' --tlsv1.2 -sSf "$rustup_url" |
        sh -s -- \
        -y \
        --profile minimal \
        --default-toolchain stable \
        --no-modify-path
}

install_external_yazi() {
    if ! command -v cargo; then
        error "Cargo is required to install Yazi"
        return 1
    fi

    run_cmd cargo install --force yazi-build
}
