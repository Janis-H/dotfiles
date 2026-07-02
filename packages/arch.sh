#!/usr/bin/env bash

# TODO: separate into core, server, and desktop packages

# always install
export CORE_PACKAGES=()

# server profile additions
export SERVER_PACKAGES=()

# desktop profile additions
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
