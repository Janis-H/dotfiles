#!/usr/bin/env bash
# Defines shared stow helper functions used by stow and unstow scripts

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing stow-actions.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Stow actions ---
run_stow(){
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    run_cmd stow \
        -R \
        --dir "$modules_dir" \
        --target "$HOME" \
        "$module" \
        >/dev/null 2>&1
}

stow_module() {
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    if [[ ! -d "$modules_dir/$module" ]]; then
        error "Module not found: $modules_dir/$module"
        return 1
    fi

    info "Stowing: $module"

    if ! run_stow "$module"; then
        error "Failed to stow: $module"
        return 1
    fi
}

stow_modules() {
	local module

	for module in "$@"; do
        stow_module "$module"
	done
}

# --- Unstow actions ---
run_unstow() {
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    run_cmd stow \
        -D \
        --dir "$modules_dir" \
        --target "$HOME" \
        "$module" \
        >/dev/null 2>&1
}

unstow_module() {
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"

    if [[ ! -d "$modules_dir/$module" ]]; then
        error "Module not found: $modules_dir/$module"
        return 1
    fi

    info "Unstowing: $module"

    if ! run_unstow "$module"; then
        error "Failed to unstow: $module"
        return 1
    fi
}

unstow_modules() {
    local module

    for module in "$@"; do
        unstow_module "$module"
    done
}
