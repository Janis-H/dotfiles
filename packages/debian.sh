#!/usr/bin/env bash

# TODO: separate into core, server, and desktop packages

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
export CORE_PACKAGES=()

# development/build tools; used by the server profile;
# - compilers, runtimes, linters, formatters, and project workflow tools
export DEV_BUILD_PACKAGES=()

# GUI/workstation additions; desktop includes core + dev/build + desktop
# - desktop session tools, terminals, browsers, editors, and GUI apps
export DESKTOP_PACKAGES=()

export PACKAGES=(
    # Desktop (GUI)
    i3
    ghostty
    picom
    rofi

    # Terminal (Server)
    build-essential
    curl
    fd-find
    git
    gzip
    jq
    python3
    python3-pip
    python3-venv
    ripgrep
    shellcheck
    shfmt
    silversearcher-ag
    stow
    tar
    tmux
    tree-sitter-cli
    unzip
    zoxide
    zsh
)
