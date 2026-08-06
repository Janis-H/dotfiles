#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# minimal terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
    7zip
    bat
    curl
    diffutils
    fd
    ffmpeg
    fzf
    git
    gzip
    jq
    neovim
    poppler
    resvg
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

# headless development/build tools:
# - compilers, runtimes, build tools, container tools, linters, formatters,
#   and project workflow tools
HEADLESS_PACKAGES=(
    base-devel
    cmake
    docker
    docker-buildx
    docker-compose
    go
    lazygit
    nodejs
    npm
    python
    python-pip
    rustup
    shellcheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=(
    flatpak
    ghostty
    xclip
    wl-clipboard
    zenity

    # sway window manager
    sway
    swayidle
    swaylock
    waybar
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
    herdr

    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins
)

EXTERNAL_HEADLESS=()

EXTERNAL_DESKTOP=(
    autotiling
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
    sway
)
