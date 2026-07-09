#!/usr/bin/env bash
# Shared helper for installing/updating git repositories

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing install-or-update-repo.sh}"

source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

install_or_update_repo() {
    local repo="$1"
    local dest="$2"
    local plugin_name

    plugin_name="$(basename "$dest")"

    if [[ -d "$dest/.git" ]]; then
        info "Updating $plugin_name"
        run_cmd git -C "$dest" pull --ff-only
        return 0
    fi

    if [[ -e "$dest" ]]; then
        warn "$dest exists but is not a git repo, skipping"
        return 0
    fi

    info "Cloning $plugin_name"
    run_cmd git clone "$repo" "$dest"
}
