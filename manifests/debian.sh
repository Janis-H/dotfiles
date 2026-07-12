#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# minimal terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
    bat
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

# headless development/build tools:
# - compilers, runtimes, linters, formatters, and project workflow tools
HEADLESS_PACKAGES=(
    build-essential
    libreadline-dev
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

    # i3 window manager setup
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
    # Apt versions update too slowly
    fzf
    neovim

    # Not available through apt
    oh_my_posh
    zoxide

    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins

)

EXTERNAL_HEADLESS=(
    lazygit
)

EXTERNAL_DESKTOP=(
    rodecaster_pipewire_setup
)

# ─────────────────────────────────────────────────────────────
# Stow module manifests
# ─────────────────────────────────────────────────────────────

# dotfile modules for the minimal terminal setup
CORE_STOW_MODULES=(
    bat
    nvim
    ohmyposh
    tmux
    zsh
    linux-scripts
)

# dotfile modules for headless development/build tooling
HEADLESS_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
DESKTOP_STOW_MODULES=(
    i3
    picom
)
