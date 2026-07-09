#!/usr/bin/env bash

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/runner.sh"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helpers ---
load_os_external_installers() {
    local os="$1"
    local external_file="$DOTFILES_DIR/external/$os.sh"

    if [[ ! -f "$external_file" ]]; then
        warn "No OS-specific external installer file found for OS: $os"
        run_os_post_install() { :; }
        return 0
    fi

    source "$external_file"
}

# --- Public entrypoint ---

# Runs external installer IDs by mapping each ID to install_external_<id>.
install_external_tools() {
    local os="$1"
    shift

    local tool install_func

    load_os_external_installers "$os"

    for tool in "$@"; do
        install_func="install_external_${tool}"

        if ! declare -F "$install_func" >/dev/null; then
            error "Missing external installer: $install_func"
            return 1
        fi

        "$install_func"
    done
}
