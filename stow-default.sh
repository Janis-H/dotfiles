#!/usr/bin/env bash
# Stows the default OS-specific set of dotfiles modules into $HOME

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Source helper functions ---
source "${DOTFILES_DIR}/lib/log.sh"
source "${DOTFILES_DIR}/lib/detect-os.sh"

# --- OS info ---
os="$(detect_os)"
info "OS: $os"

# --- Stow modules ---
COMMON_MODULES=(
	bat 
    lazygit 
    nvim 
    zsh
)

ARCH_MODULES=()

DEBIAN_MODULES=(
    i3
    picom 
)

MACOS_MODULES=()

# --- Helper functions ---
run_stow(){
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    stow \
        -R \
        --dir "$modules_dir" \
        --target "$HOME" \
        "$module" \
        >/dev/null 2>&1
}

stow_module() {
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    # check if module directory exists
    if [[ ! -d "$modules_dir/$module" ]]; then
        # display error if does not
        error "Module not found: $modules_dir/$module"
        return 1
    fi

    info "Stowing: $module"

    # run stow command
    # if stow exits with a non-zero status, display error
    if ! run_stow "$module"; then
        error "Failed to stow: $module"
        return 1
    fi
}

stow_all_modules() {
	local module

	# TODO: seperate stow logic by os
	for module in "$@"; do
        stow_module "$module"
	done
}

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
