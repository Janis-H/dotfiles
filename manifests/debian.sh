#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
    curl
    fd-find
    git
    gzip
    jq
    ripgrep
    silversearcher-ag
    stow
    tar
    tmux
    unzip
    zsh
)

# development/build tools:
# - compilers, runtimes, linters, formatters, and project workflow tools
DEV_BUILD_PACKAGES=(
    build-essential
    python3
    python3-pip
    python3-venv
    shellcheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=(
    ghostty
    i3
    picom
    rofi
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=(
    # apt version updates too slowly
    fzf
    neovim

    # not available in apt
    oh_my_posh
    zoxide
)

EXTERNAL_DEV_BUILD=(
    lazygit
)

EXTERNAL_DESKTOP=(
    rodecaster_pipewire_setup
)

# ─────────────────────────────────────────────────────────────
# Stow module manifests
# ─────────────────────────────────────────────────────────────

# dotfile modules for the bare terminal setup
CORE_STOW_MODULES=(
    bat
    nvim
    ohmyposh
    tmux
    zsh
    linux-scripts
)

# dotfile modules for development/build tooling
DEV_BUILD_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
DESKTOP_STOW_MODULES=(
    i3
    picom
)
