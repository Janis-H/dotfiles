#!/usr/bin/env bash
# shellcheck disable=SC2034

# ─────────────────────────────────────────────────────────────
# Package manifests
# ─────────────────────────────────────────────────────────────

# minimal terminal/dotfiles setup:
# - shell, editor, search, navigation, archive, and dotfile tools
CORE_PACKAGES=(
    7zip
    bat
    curl
    diffutils
    fd-find
    ffmpeg-free
    fzf
    git
    gzip
    jq
    neovim
    poppler-utils
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
    cmake
    containerd.io
    docker-buildx-plugin
    docker-ce
    docker-ce-cli
    docker-compose-plugin
    gcc
    gcc-c++
    golang
    ipython
    make
    nodejs
    python3
    python3-pip
    python3-wheel
    rustup
    ShellCheck
    shfmt
    tree-sitter-cli
)

# GUI/workstation additions:
# - window managers, launchers, graphical terminals, editors, and GUI apps
DESKTOP_PACKAGES=(
    # General desktop
    1password
    flatpak
    ghostty
    helium-bin
    zenity

    # Theming tooling
    lxappearance
    kvantum
    kvantum-qt5
    qt5ct
    qt6ct

    # Adwaita theme
    adw-gtk3-theme

    # Arc theme
    arc-kde
    arc-theme

    # Breeze theme
    breeze-gtk
    plasma-breeze-qt5
    plasma-breeze-qt6

    # Papirus icons
    papirus-icon-theme
    papirus-icon-theme-dark

    # Desktop audio
    pipewire
    pipewire-alsa
    pipewire-pulseaudio
    wireplumber

    # Audio controls and diagnostics
    alsa-utils
    pavucontrol
    pulseaudio-utils

    # Camera controls and diagnostics
    v4l-utils

    # Keyboard diagnostics
    libinput-utils
    wev
    evtest

    # Desktop portals
    xdg-desktop-portal-gtk

    # Shared window-manager tooling
    python3-i3ipc
    rofi

    # i3 / X11 tooling
    i3
    picom
    xclip
    xorg-x11-server-Xorg
    xwallpaper

    # Shared Wayland tooling
    mako
    swaybg
    swaylock
    swayidle
    waybar
    wl-clipboard
    xorg-x11-server-Xwayland

    # Niri-specific tooling
    niri
    xwayland-satellite
    xdg-desktop-portal-gnome

    # TODO: look into dms and repo setup?
    # Reference: https://niri-wm.github.io/niri/Getting-Started.html

    # Optional Niri desktop shell
    # dms

    # Sway-specific tooling
    sway
    xdg-desktop-portal-wlr
)

# ─────────────────────────────────────────────────────────────
# External tools manifests
# ─────────────────────────────────────────────────────────────

# NOTE:
# External installer IDs.
# Each value maps to a function named install_external_<id>.
EXTERNAL_CORE=(
    herdr
    oh_my_posh
    resvg
    yazi

    # Manages zsh plugins
    antidote

    # Manual alternative to Antidote
    # zsh_plugins
)

EXTERNAL_HEADLESS=(
    claude_code
    codex
    lazygit
    lazydocker
)

EXTERNAL_DESKTOP=(
    autotiling
    dejavu_font
    fira_code_font
    julia_mono_font
    proton_mail
    proton_pass
    zen_browser

    # Fonts:
    dejavu_font
    fira_code_font
    hack_font
    julia_mono_font

    # Cursor theme:
    bibata_cursor_theme

    # GTK and Qt/Gvantum theme:
    graphite_theme

    # GTK and Qt/Gvantum theme:
    nordic_theme
)

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
DESKTOP_STOW_MODULES=(
    ghostty
    hexchat
    i3
    picom
    rofi
    sway
    theme
)
