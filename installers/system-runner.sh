#!/usr/bin/env bash
# shellcheck disable=SC1090

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/system-runner.sh}"

source "$DOTFILES_DIR/lib/log.sh"

# --- Helpers ---
load_system_installer() {
    local os="$1"
    local system_file="$DOTFILES_DIR/installers/system/$os.sh"

    if [[ ! -f "$system_file" ]]; then
        error "No system installer found for OS: $os"
        return 1
    fi

    source "$system_file"
}

# --- Public entrypoints ---
run_system_installs() {
    local os="$1"
    shift

    load_system_installer "$os"

    title "System Packages"

    install_system_packages "$@"
}

run_system_cask_installs() {
    local os="$1"
    shift

    if [[ "$os" == "macos" ]]; then
        return 0
    fi

    load_system_installer "$os"

    title "System Casks"

    install_system_casks "$@"
}

