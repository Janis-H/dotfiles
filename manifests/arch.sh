#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
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
DEV_BUILD_PACKAGES=(
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
DESKTOP_PACKAGES=(
    ghostty
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=()

EXTERNAL_DEV_BUILD=()

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
DESKTOP_STOW_MODULES=()
