#!/usr/bin/env bash

# TODO: separate into core, server, and desktop packages

# always install
export CORE_PACKAGES=()

# server profile additions
export SERVER_PACKAGES=()

# desktop profile additions
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
