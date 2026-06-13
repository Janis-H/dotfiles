#!/usr/bin/env bash
# Defines Debian-family package installtion logic

# --- Packages ---
DEBIAN_PACKAGES=(
    # Desktop (GUI)
    i3
    picom
    rofi

    # Terminal (Server)
    curl
    fd-find
    ghostty
    git
    gzip
    jq
    python3
    python3-pip
    python3-venv
    ripgrep
    silversearcher-ag
    stow
    tar
    tmux
    unzip
    yazi
    zsh
)

# Available in apt, but Debian versions tend to lag behind.
# Installed externally instead.
# - nvim
# - fzf

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
