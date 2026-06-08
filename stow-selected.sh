#!/usr/bin/env bash
# Stows only the dotfile modules passed as command-line arguments

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Source helper functions ---
source "${DOTFILES_DIR}/lib/log.sh"
source "${DOTFILES_DIR}/lib/stow-actions.sh"


# --- Unstow selected modules ---

if [[ $# -eq 0 ]]; then
    error "Usage: ./stow-selected <module> [module...]"
    exit 1
fi

stow_modules "$@"
