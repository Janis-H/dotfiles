#!/usr/bin/env bash
# Unstows the default OS-specific set of dotfile modules from $HOME

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Source helper functions ---
source "${DOTFILES_DIR}/lib/log.sh"
source "${DOTFILES_DIR}/lib/detect-os.sh"
source "${DOTFILES_DIR}/lib/stow-modules.sh"
source "${DOTFILES_DIR}/lib/stow-actions.sh"


# --- OS info ---
os="$(detect_os)"
info "OS: $os"

# --- Unstow config files ---
case "$os" in
    debian)
        unstow_all_modules \
            "${COMMON_MODULES[@]}" \
            "${DEBIAN_MODULES[@]}"
        ;;
    arch)
        unstow_all_modules \
            "${COMMON_MODULES[@]}" \
            "${ARCH_MODULES[@]}"
        ;;
    macos)
        unstow_all_modules \
            "${COMMON_MODULES[@]}" \
            "${MACOS_MODULES[@]}"
        ;;
    *)
        error "Unsupported OS: $os"
        exit 1
        ;;
esac
