#!/usr/bin/env bash
# Defines macOS package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/macos.sh}"

# --- Source packages ---
source "$DOTFILES_DIR/packages/macos.sh"

# --- Helper Functions ---
is_formula_installed() {
    brew list --formula "$1" &>/dev/null
}

is_cask_installed() {
    brew list --cask "$1" &>/dev/null
}

ensure_xcode_tools() {
    if -pkgutil --pkg-info=com.apple.pkg.CLTools_Executables &>/dev/null; then
        info "Xcode Command Line Tools already installed"
        return
    fi

    info "Installing Xcode Command Line Tools"
    xcode-select --install

    info "Finish the macOS install prompt, then rerun this script"
    exit 1
}

ensure_homebrew() {
    if command -v brew &>/dev/null; then
        info "Homebrew already installed"
        return
    fi

    info "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
    ensure_xcode_tools
    ensure_homebrew

    install_brew_packages "${PACKAGES[@]}"
    install_brew_casks "${CASKS[@]}"

    install_external_tools
}
