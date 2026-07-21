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
# - compilers, runtimes, build tools, container tools, linters, formatters,
#   and project workflow tools
HEADLESS_PACKAGES=(
    build-essential
    cmake
    containerd.io
    docker-buildx-plugin
    docker-ce
    docker-ce-cli
    docker-compose-plugin
    golang-go
    nodejs
    python3
    python3-pip
    python3-venv
    shellcheck
    shfmt
    tree-sitter-cli
    uuid-dev
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=(
    1password
    ghostty
    xclip
    wl-clipboard

    # i3 window manager
    i3
    picom
    rofi

    # sway window manager
    sway
    swayidle
    swaylock
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=(
    fzf
    neovim
    oh_my_posh
    yazi
    zoxide

    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins
)

EXTERNAL_HEADLESS=(
    lazydocker
    lazygit
    rust_and_cargo
)

EXTERNAL_DESKTOP=()

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
