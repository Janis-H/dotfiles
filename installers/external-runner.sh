#!/usr/bin/env bash
# shellcheck disable=SC1090

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external-runner.sh"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/print-list.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Loaders ---
load_common_external_installers() {
    local common_file="$DOTFILES_DIR/installers/external/common.sh"

    if [[ ! -f "$common_file" ]]; then
        return 0
    fi

    source "$common_file"
}

load_os_external_installers() {
    local os="$1"
    local external_file="$DOTFILES_DIR/installers/external/$os.sh"

    if [[ ! -f "$external_file" ]]; then
        error "No external installers found for OS: $os"
        return 1
    fi

    source "$external_file"
}

load_external_installers() {
    local os="$1"

    load_common_external_installers || return 1
    load_os_external_installers "$os" || return 1
}

# --- Dispatch ---
install_external_tool () {
    local tool="$1"
    local installer="install_external_${tool}"

    if ! declare -F "$installer" >/dev/null; then
        error "Missing external installer: $installer"
        return 1
    fi

    "$installer"
}

# --- Public entrypoint ---
# Runs external installer IDs by mapping each ID to install_external_<id>.
run_external_installs() {
    local os="$1"
    shift

    local tools=("$@")
    local tool
    local failed_tools=()

    load_external_installers "$os"

    title "External Tools"

    if (( ${#tools[@]} == 0 )); then
        info "No external tools configured"
        return 0
    fi

    info "Installing external tools: ${#tools[@]}"
    print_list "${tools[@]}"
    printf '\n'

    for tool in "${tools[@]}"; do
        if ! install_external_tool "$tool"; then
            failed_tools+=("$tool")
        fi
    done

    if (( ${#failed_tools[@]} > 0 )); then
        error "External tools failed:"
        print_list "${failed_tools[@]}" >&2
        return 1
    fi
}
