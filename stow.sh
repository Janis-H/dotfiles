#!usr/bash/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Configs ---
STOW_CONFIGS=(
	i3 bat lazygit nvim picom zsh
)

# --- Message helper functions ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

function info() {
    echo -e "${GREEN} INFO:${NO_COLOR} $*"
}

function warn() {
    echo -e "${YELLOW} WARN:${NO_COLOR} $*"
}

function error() {
    echo -e "${RED} ERROR:${NO_COLOR} $*"
}

# --- Helper functions ---
function stow_configs() {
	local pkg

	# cd to dotfiles directory
	cd "$DOTFILES_DIR" || return 1

	# attempt to stow each argument; else, notify the user
	for pkg in "$@"; do
		if [[ -d "$pkg" ]]; then
			info "Stowing: $pkg"
			stow -R "$pkg" 2>/dev/null
		else
			error "Package directory not found: $pkg"
		fi
	done
}

# --- Stow config files ---
stow_configs "${STOW_CONFIGS[@]}"
