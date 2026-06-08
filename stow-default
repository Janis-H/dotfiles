#!/usr/bin/env bash
# Stows the default OS-specific set of dotfiles modules into $HOME

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

# --- Stow config files ---
case "$os" in
    debian)
        stow_all_modules \
            "${COMMON_MODULES[@]}" \
            "${DEBIAN_MODULES[@]}"
        ;;
    arch)
        stow_all_modules \
            "${COMMON_MODULES[@]}" \
            "${ARCH_MODULES[@]}"
        ;;
    macos)
        stow_all_modules \
            "${COMMON_MODULES[@]}" \
            "${MACOS_MODULES[@]}"
        ;;
    *)
        error "Unsupported OS: $os"
        exit 1
        ;;
esac
