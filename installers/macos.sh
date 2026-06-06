#!/usr/bin/env bash

# --- Packages ---
MACOS_PACKAGES=(
    # install packages here (WIP)
)

# --- Helper Functions ---
function is_installed() {
    brew info "$1" &>/dev/null
}

function install_system_packages() {
    local to_install=()
    local pkg

    # for each argument
    for pkg in "$@"; do
        # check if package installed
        if is_installed "$pkg"; then
            info "$pkg already installed"
        #else add package to install array
        else
            to_install+=("$pkg")
        fi
    done

    # if number of to_install is greater than 0
    if [[ ${#to_install[@]} -gt 0  ]]; then
        # notify user about each package being installed
        info "Installing: ${to_install[*]}"
    
        # TODO: find way to brew install without interaction
        # install all packages in to_install array
        brew install "${to_install[@]}"
    fi
}

# --- Install packages ---
function install_macos() {
    # TODO: install homebrew (for installing command-line software)
    install_system_packages "${MACOS_PACKAGES[@]}"
    install_external_tools
}
