#!/usr/bin/env bash

# TODO: separate into core, server, packages, and desktop packages

# always install
export CORE_PACKAGES=()

# server profile additions
export SERVER_PACKAGES=()

# desktop profile additions
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
