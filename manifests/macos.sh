#!/usr/bin/env bash

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
export CORE_PACKAGES=(
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
    neovim
    ripgrep
    stow
    the_silver_searcher
    tmux
    tree
    unzip
    wget
    yazi
    zoxide
    zsh
)

# development/build tools:
# - compilers, runtimes, linters, formatters, and project workflow tools
export DEV_BUILD_PACKAGES=(
    lazygit
    python3
    shellcheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
export DESKTOP_PACKAGES=()

# ─────────────────────────────────────────────────────────────
# Homebrew cask manifests
# ─────────────────────────────────────────────────────────────

# GUI/workstation casks
export DESKTOP_CASKS=(
    ghostty
    zed
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
export EXTERNAL_CORE=()

export EXTERNAL_DEV_BUILD=()

export EXTERNAL_DESKTOP=()

# ─────────────────────────────────────────────────────────────
# Stow module manifests
# ─────────────────────────────────────────────────────────────

# dotfile modules for the bare terminal setup
export CORE_STOW_MODULES=(
    bat
    nvim
    ohmyposh
    tmux
    zsh
)

# dotfile modules for development/build tooling
export DEV_BUILD_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
export DESKTOP_STOW_MODULES=()
