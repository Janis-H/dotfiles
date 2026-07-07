#!/usr/bin/env bash

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/macos.sh"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# Runs external installer IDs by mapping each ID to install_external_<id>.
install_external_tools() {
    local tool install_func

    for tool in "$@"; do
        install_func="install_external_${tool}"

        # TODO: add shared lib validate_function for validating functions

        if ! declare -F "$install_func" >/dev/null; then
            error "Missing external installer: $install_func"
            return 1
        fi

        "$install_func"
    done
}
