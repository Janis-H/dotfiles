#!/usr/bin/env bash

# TODO: separate into core, server, and desktop packages

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

# development/build tools; used by the server profile;
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

# GUI/workstation additions; desktop includes core + dev/build + desktop
# - window managers, launchers, graphical terminals, editors, and GUI apps
export DESKTOP_PACKAGES=(
    ghostty
    i3
    picom
    rofi
)

# TODO: DELETE BELOW ONCE TRANSITION IS DONE
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
