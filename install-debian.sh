#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function stow_packages() {
	local pkg
	# go to dotfiles directory
	cd "$DOTFILES_DIR" || return 1
	# attempt to stow each argument
	for pkg in "$@"; do
		if [[ -d "$pkg" ]]; then
			echo "Stowing: $pkg"
			stow -R "$pkg" 2>/dev/null
		else
			echo "Package directory not found: $pkg"
		fi
	done
}

# --- Stow packages ---
STOW_PACKAGES=(
	i3 bat lazygit nvim picom zsh
)

# call stow_packages function
stow_packages "${STOW_PACKAGES[@]}"
