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
    fd-find
    ffmpeg-free
    fzf
    git
    gzip
    jq
    neovim
    poppler-utils
    ripgrep
    stow
    tar
    the_silver_searcher
    tmux
    unzip
    zoxide
    zsh
)

# headless development/build tools:
# - compilers, runtimes, build tools, container tools, linters, formatters,
#   and project workflow tools
HEADLESS_PACKAGES=(
    @development-tools
    cmake
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
    gcc
    gcc-c++
    golang
    nodejs
    python3
    python3-pip
    rustup
    ShellCheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=(
    1password
    flatpak
    helium-bin
    ghostty
    xclip
    wl-clipboard
    zenity

    # i3 window manager
    xorg-x11-server-Xorg
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
    herdr
    oh_my_posh
    resvg
    yazi

    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins
)

EXTERNAL_HEADLESS=(
    lazygit
    lazydocker
)

EXTERNAL_DESKTOP=(
    proton_mail
    proton_pass
    zen_browser
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
