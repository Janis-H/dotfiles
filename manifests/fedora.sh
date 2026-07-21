#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# minimal terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
    bat
    curl
    diffutils
    fd-find
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
    zoxide
    zsh
)

# headless development/build tools:
# - compilers, runtimes, build tools, container tools, linters, formatters,
#   and project workflow tools
HEADLESS_PACKAGES=(
    # TODO: setup docker repository in installers/system/fedora
    # TODO: run `sudo dnf copr enable atim/lazygit -y`
    @development-tools
    cmake
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
    golang
    lazygit
    nodejs
    python3
    python3-pip
    rust
    cargo
    ShellCheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=(
    ghostty
    xclip
    wl-clipboard

    # i3 window manager
    i3
    picom
    rofi

    # sway window manager
    sway
    swayidle
    swaylock
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=(
    yazi

    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins
)

EXTERNAL_HEADLESS=(
    # TODO: add install_external_lazydocker to external installers
    # - run `go install github.com/jesseduffield/lazydocker@latest` in function
    # TODO: uncomment below once the external function has been added
    # lazydocker
)

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
    linux-scripts
)

# dotfile modules for headless development/build tooling
HEADLESS_STOW_MODULES=(
    lazygit
)

# dotfile modules for GUI/workstation setup
DESKTOP_STOW_MODULES=()
