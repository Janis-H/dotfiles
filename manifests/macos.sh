#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
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
DEV_BUILD_PACKAGES=(
    lazygit
    python3
    shellcheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=()

# ─────────────────────────────────────────────────────────────
# Homebrew cask manifests
# ─────────────────────────────────────────────────────────────

# GUI/workstation casks
DESKTOP_CASKS=(
    ghostty
    zed
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=()

EXTERNAL_DEV_BUILD=()

EXTERNAL_DESKTOP=()

# ─────────────────────────────────────────────────────────────
# Stow module manifests
# ─────────────────────────────────────────────────────────────

# dotfile modules for the bare terminal setup
CORE_STOW_MODULES=(
    bat
    nvim
    ohmyposh
    tmux
    zsh
)

# dotfile modules for development/build tooling
DEV_BUILD_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
DESKTOP_STOW_MODULES=()
