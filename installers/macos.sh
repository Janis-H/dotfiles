#!/usr/bin/env bash
# Defines macOS package installation logic

# --- Packages ---
MACOS_BREW_PACKAGES=(
    fd
    git
    jq
    python3
    ripgrep
    the_silver_searcher
    stow
    tmux
    yazi
)

MACOS_BREW_CASKS=(
    ghostty
    zed
)

# --- Helper Functions ---
is_formula_installed() {
    brew list --formula "$1" &>/dev/null
}

is_cask_installed() {
    brew list --cask "$1" &>/dev/null
}

install_brew_packages() {
    local to_install=()
    local pkg

    for pkg in "$@"; do
        if is_formula_installed "$pkg"; then
            info "$pkg already installed"
        else
            to_install+=("$pkg")
        fi
    done

    if [[ ${#to_install[@]} -gt 0  ]]; then
        info "Installing packages: ${to_install[*]}"

        brew install "${to_install[@]}"
    fi
}

install_brew_casks() {
    local to_install=()
    local cask

    for cask in "$@"; do
        if is_cask_installed "$cask"; then
            info "$cask already installed"
        else
            to_install+=("$cask")
        fi
    done

    if [[ ${#to_install[@]} -gt 0  ]]; then
        info "Installing casks: ${to_install[*]}"

        brew install --cask "${to_install[@]}"
    fi
}

# --- Install packages ---
install_macos() {
    # TODO: install homebrew (for installing command-line software)
    install_brew_packages "${MACOS_BREW_PACKAGES[@]}"
    install_brew_casks "${MACOS_BREW_CASKS[@]}"
    install_external_tools
}
