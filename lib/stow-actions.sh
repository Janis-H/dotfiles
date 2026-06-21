#!/usr/bin/env bash
# Defines shared stow helper functions used by stow and unstow scripts

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing stow-actions.sh}"

# --- Stow actions ---
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

	for module in "$@"; do
        stow_module "$module"
	done
}

# --- Unstow actions ---
run_unstow() {
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

    info "Unstowing: $module"

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
