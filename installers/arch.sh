#!/usr/bin/env bash
# Defines Arch-family package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/arch.sh}"

# --- Source packages ---
source "$DOTFILES_DIR/packages/arch.sh"

# --- Source external tool installer ---
source "$DOTFILES_DIR/installers/external/arch.sh"

# --- Helper Functions ---
is_installed() {
    pacman -Qi "$1" &>/dev/null
}

install_system_packages() {
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

        # install all packages in to_install array
        sudo pacman -Sy --needed "${to_install[@]}"
    fi
}

# --- Install packages ---
install_packages() {
    install_system_packages "${PACKAGES[@]}"
    install_external_tools
}
