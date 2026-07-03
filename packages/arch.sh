#!/usr/bin/env bash

# TODO: separate into core, server, and desktop packages

# bare terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
export CORE_PACKAGES=(
    bat
    curl
    diffutils
    fd
    fzf
    git
    gzip
    jq
    neovim
    ripgrep
    stow
    tar
    the_silver_searcher
    tmux
    unzip
    yazi
    zoxide
    zsh
)

# development/build tools; used by the server profile;
# - compilers, runtimes, linters, formatters, and project workflow tools
export DEV_BUILD_PACKAGES=(
    base-devel
    lazygit
    python
    python-pip
    shellcheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions; desktop includes core + dev/build + desktop
# - window managers, launchers, graphical terminals, editors, and GUI apps
# TODO: add hyprland and/or sway
export DESKTOP_PACKAGES=(
    ghostty
)

# TODO: DELETE BELOW ONCE TRANSITION IS DONE
export PACKAGES=(
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
