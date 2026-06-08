#!/usr/bin/env bash

# --- Packages ---
DEBIAN_PACKAGES=(
    # window tiling manager
    i3

    # improved "find"
    fd-find

    # terminal
    ghostty

    # version control
    git

    # json formatter
    jq

    # standalone compositor for x11 (i3)
    picom

    # improved "grep"
    ripgrep

    # application launcher
    rofi

    # file / content search
    silversearcher-ag

    # symlink manager
    stow

    # terminal file manager
    yazi

    # enhanced version of bash
    zsh 
)

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
    install_system_packages "${DEBIAN_PACKAGES[@]}"
    install_external_tools
}
