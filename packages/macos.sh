#!/usr/bin/env bash

# TODO: separate into core, server, dev_packages, and desktop packages
export CORE_PACKAGES=()
export DEV_PACKAGES=()
export SERVER_PACKAGES=()
export DESKTOP_PACKAGES=()

export PACKAGES=(
    bat
    coreutils
    curl
    diffutils
    fd
    findutils
    fzf
    gawk
    git
    gnu-sed
    grep
    gzip
    jandedobbeleer/oh-my-posh/oh-my-posh
    jq
    lazygit
    neovim
    python3
    ripgrep
    shellcheck
    shfmt
    stow
    the_silver_searcher
    tmux
    tree
    tree-sitter-cli
    unzip
    wget
    yazi
    zoxide
    zsh
)

export CASKS=(
    ghostty
    zed
)
