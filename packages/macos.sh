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
