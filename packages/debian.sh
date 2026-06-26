#!/usr/bin/env bash
# TODO: separate into core, server, personal, and desktop packages
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
