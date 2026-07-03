#!/usr/bin/env bash

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
export CORE_PACKAGES=(
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
    zoxide
    zsh
)

# development/build tools:
# - compilers, runtimes, linters, formatters, and project workflow tools
export DEV_BUILD_PACKAGES=(
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
export DESKTOP_PACKAGES=(
    ghostty
    i3
    picom
    rofi
)

# ─────────────────────────────────────────────────────────────
# Stow module manifests
# ─────────────────────────────────────────────────────────────

# dotfile modules for the bare terminal setup
export CORE_STOW_MODULES=(
    bat
    nvim
    ohmyposh
    tmux
    zsh
    linux-scripts
)

# dotfile modules for development/build tooling
export DEV_BUILD_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
export DESKTOP_STOW_MODULES=(
    i3
    picom
)
