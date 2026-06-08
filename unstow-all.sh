#!/usr/bin/env bash
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
run_unstow(){
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    stow \
        -D \
        --dir "$modules_dir" \
        --target "$HOME" \
        "$module" \
        >/dev/null 2>&1
}

unstow_module() {
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    # check if module directory exists
    if [[ ! -d "$modules_dir/$module" ]]; then
        # display error if does not
        error "Module not found: $modules_dir/$module"
        return 1
    fi

    info "Stowing: $module"

    # run unstow command
    # if stow exits with a non-zero status, display error
    if ! run_unstow "$module"; then
        error "Failed to unstow: $module"
        return 1
    fi
}

unstow_all_modules() {
	local module

	for module in "$@"; do
        unstow_module "$module"
	done
}

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
