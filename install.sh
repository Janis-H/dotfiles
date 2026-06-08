#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# source helper functions
source "$DOTFILES_DIR/lib/detect-os.sh"
source "$DOTFILES_DIR/lib/log.sh"

os="$(detect_os)"

info "OS: $os"

case "$os" in
    debian)
        source "$DOTFILES_DIR/installers/debian.sh"
        source "$DOTFILES_DIR/installers/external/debian.sh"
        install_debian
        ;;
    arch)
        source "$DOTFILES_DIR/installers/arch.sh"
        source "$DOTFILES_DIR/installers/external/arch.sh"
        install_arch
        ;;
    macos)
        source "$DOTFILES_DIR/installers/macos.sh"
        source "$DOTFILES_DIR/installers/external/macos.sh"
        install_macos
        ;;
    *)
        info "Unsupported OS: $os" >&2
        exit 1
        ;;
esac
