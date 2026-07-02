#!/usr/bin/env bash

# TODO: separate into core, server, dev_packages, and desktop packages
export CORE_PACKAGES=()
export DEV_PACKAGES=()
export SERVER_PACKAGES=()
export DESKTOP_PACKAGES=()

# TODO: add hyprland and/or sway
export ARCH_PACKAGES=(
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
