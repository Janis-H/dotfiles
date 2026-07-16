#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Homebrew formula manifests
# ─────────────────────────────────────────────────────────────

# minimal terminal/dotfiles setup:
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

# headless development/build tools:
# - compilers, runtimes, build tools, container tools, linters, formatters,
#   and project workflow tools
HEADLESS_PACKAGES=(
    docker
    docker-buildx
    docker-compose
    colima
    go
    lazygit
    luarocks
    node
    python3
    shellcheck
    shfmt
    tree-sitter-cli
)

# Desktop formula additions
# Most macOS GUI apps should usually go in DESKTOP_CASKS
DESKTOP_PACKAGES=()

# ─────────────────────────────────────────────────────────────
# Homebrew cask manifests
# ─────────────────────────────────────────────────────────────

# Desktop GUI/workstation casks
DESKTOP_CASKS=(
    docker-desktop
    ghostty
    # TODO: add aerospace config
    # - aerospace guide: https://nikitabobko.github.io/AeroSpace/guide
    nikitabobko/tap/aerospace
    zed
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=(
    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins
)

EXTERNAL_HEADLESS=()

EXTERNAL_DESKTOP=()

# ─────────────────────────────────────────────────────────────
# Stow module manifests
# ─────────────────────────────────────────────────────────────

# dotfile modules for the minimal terminal setup
CORE_STOW_MODULES=(
    bat
    nvim
    ohmyposh
    tmux
    zsh
)

# dotfile modules for headless development/build tooling
HEADLESS_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
DESKTOP_STOW_MODULES=()
