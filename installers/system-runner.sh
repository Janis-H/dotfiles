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

    local packages=("$@")
    local to_install=()
    local pkg

    load_system_installer "$os" || return 1

    title "System Packages"

    if (( ${#packages[@]} == 0 )); then
        info "No packages to install"
        return 0
    fi

    for pkg in "${packages[@]}"; do
        if is_system_package_installed "$pkg"; then
            info "$pkg already installed"
            continue
        fi

        to_install+=("$pkg")
    done

    if (( ${#to_install[@]} == 0 )); then
        info "All packages already installed"
        return 0
    fi

    info "Installing packages: ${to_install[*]}"
    install_system_packages "${to_install[@]}"
}

run_system_cask_installs() {
    local os="$1"
    shift

    local casks=("$@")
    local to_install=()
    local cask

    [[ "$os" != "macos" ]] || return 0

    load_system_installer "$os" || return 1

    # TODO: move this to separate validate function. Also check for:
    #   - is_system_package_installed
    #   - is_system_cask_installed (macos only)
    #   - install_system_packages
    #   - install_system_casks (macos only)
    if ! declare -F install_system_casks >/dev/null; then
        warn "No system cask installer defined for OS: $os"
        return 0
    fi

    title "Homebrew Casks"

    if (( "${#casks[@]}" == 0 )); then
        info "No casks to install"
        return 0
    fi

    for cask in "${casks[@]}"; do
        if is_system_package_installed "$cask"; then
            info "$cask already installed"
            continue
        fi

        to_install+=("$cask")
    done

    if (( ${#to_install[@]} == 0 )); then
        info "All casks already installed"
        return 0
    fi

    info "Installing casks: ${to_install[*]}"
    install_system_casks "${to_install[@]}"
}

