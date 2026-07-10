#!/usr/bin/env bash
# shellcheck disable=SC1090

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external-runner.sh"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helpers ---
load_os_external_installers() {
    local os="$1"
    local external_file="$DOTFILES_DIR/installers/external/$os.sh"

    if [[ ! -f "$external_file" ]]; then
        warn "No OS-specific external installer file found for OS: $os"
        run_os_post_install() { :; }
        return 0
    fi

    source "$external_file"
}

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

    load_os_external_installers "$os"

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
        error "The following external tools failed:"
        printf '  - %s\n' "${failed_tools[@]}" >&2
        return 1
    fi
}
