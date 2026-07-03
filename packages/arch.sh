#!/usr/bin/env bash

# TODO: separate into core, server, and desktop packages

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
export CORE_PACKAGES=()

# development/build tools; used by the server profile;
# - compilers, runtimes, linters, formatters, and project workflow tools
export DEV_BUILD_PACKAGES=()

# GUI/workstation additions; desktop includes core + dev/build + desktop
# - window managers, launchers, graphical terminals, editors, and GUI apps
export DESKTOP_PACKAGES=()

# TODO: add hyprland and/or sway
export PACKAGES=(
    base-devel
    bat
    curl
    diffutils
    fd
    fzf
    ghostty
    git
    gzip
    jq
    lazygit
    neovim
    python
    python-pip
    ripgrep
    shellcheck
    shfmt
    stow
    tar
    the_silver_searcher
    tmux
    tree-sitter-cli
    unzip
    yazi
    zoxide
    zsh
)
