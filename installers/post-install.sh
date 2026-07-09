#!/usr/bin/env bash
# Defines shared post-install setup after package and external tool installation

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/post-install.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Setup functions ---
install_zsh_plugin() {
    local repo="$1"
    local dest="$2"
    local plugin_name

    plugin_name="$(basename "$dest")"

    if [[ -d "$dest/.git" ]]; then
        info "Updating $plugin_name"
        run_cmd git -C "$dest" pull --ff-only
    else
        info "Cloning $plugin_name"
        run_cmd git clone "$repo" "$dest"
    fi
}

# TODO: move some of these installs to packages array and external array
install_zsh_plugins() {
    local zsh_plugins_dir="$HOME/.zsh/plugins"

    run_cmd mkdir -p "$zsh_plugins_dir"

    install_zsh_plugin \
        "https://github.com/zsh-users/zsh-autosuggestions" \
        "$zsh_plugins_dir/zsh-autosuggestions"

    install_zsh_plugin \
        "https://github.com/zsh-users/zsh-syntax-highlighting.git" \
        "$zsh_plugins_dir/zsh-syntax-highlighting"

    install_zsh_plugin \
        "https://github.com/Aloxaf/fzf-tab" \
        "$zsh_plugins_dir/fzf-tab"

    install_zsh_plugin \
        "https://github.com/zsh-users/zsh-completions" \
        "$zsh_plugins_dir/zsh-completions"

    install_zsh_plugin \
        "https://github.com/zsh-users/zsh-history-substring-search.git" \
        "$zsh_plugins_dir/zsh-history-substring-search"
}

# --- Post Install Function ---
run_post_install() {
    install_zsh_plugins
    # TODO: add check for missing tools
    # TODO: consider adding a check script as a dotfiles directory sanity check
}
