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

install_external_rust_and_cargo() {
    if command -v rustc && command -v cargo; then
        info "Rust and Cargo already installed"
        return 0
    fi

    info "Installing rust and cargo"

    # NOTE:
    # Do not use run_cmd here
    # Dry-run must be checked before the pipeline so the curl does not run
    if [[ "${DRY_RUN:-false}" = true ]]; then
        printf '+ curl https://sh.rustupl.rs -sSf | sh'
    fi

    curl https://sh.rustup.rs -sSf | sh
}
