#!/usr/bin/env bash

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
export CORE_PACKAGES=(
    bat
    curl
    diffutils
    fd
    fzf git
    gzip
    jq
    neovim
    ripgrep
    stow
    tar
    the_silver_searcher
    tmux
    unzip
    yazi
    zoxide
    zsh
)

# development/build tools:
# - compilers, runtimes, linters, formatters, and project workflow tools
export DEV_BUILD_PACKAGES=(
    base-devel
    lazygit
    python
    python-pip
    shellcheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
# TODO: add hyprland and/or sway
export DESKTOP_PACKAGES=(
    ghostty
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
export DESKTOP_STOW_MODULES=()
