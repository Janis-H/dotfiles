#!/usr/bin/env bash
# Defines Debian-family package installtion logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing debian.sh}"

# --- Source packages ---
source "$DOTFILES_DIR/packages/debian.sh"

# --- Helper Functions ---
is_installed() {
    dpkg -s "$1" &>/dev/null
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
        sudo apt-get install -y "${to_install[@]}"
    fi
}

# --- Install packages ---
install_debian() {
    install_system_packages "${PACKAGES[@]}"
    install_external_tools
}
