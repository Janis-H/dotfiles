#!/usr/bin/env bash
# Defines shared stow helper functions used by stow and unstow scripts

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing stow-actions.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helpers ---
create_backup() {
    local target="$1"
    local backup="${target}.bak"

    if [[ ! -e "$target" && ! -L "$target" ]]; then
        return 0
    fi

    if [[ -e "$backup" || -L "$backup" ]]; then
        backup="${target}.bak.$(date +%Y%m%d%H%M%S)"
    fi

    warn "Backing up existing target: $target -> $backup"

    run_cmd mv "$target" "$backup"
}

backup_stow_conflicts() {
    local module="$1"
    local modules_dir="$DOTFILES_DIR/modules"
    local module_dir="$modules_dir/$module"
    local source
    local relative_path
    local target

    while IFS= read -r -d '' source; do
        relative_path="${source#"$module_dir"/}"
        target="$HOME/$relative_path"

        # Nothing exists at the target path, so stow can link safely.
        if [[ ! -e "$target" && ! -L "$target" ]]; then
            continue
        fi

        # Existing symlinks are usually already managed by stow.
        # Leave them alone to avoid breaking restows.
        if [[ -L "$target" ]]; then
            continue
        fi

        create_backup "$target"
    done < <(find "$module_dir" \( -type f -o -type l \) -print0)
}

process_stow_module() {
    local module="$1"
    local stow_flag="$2"
    local action_label="$3"
    local modules_dir="$DOTFILES_DIR/modules"

    local stow_args=(
        "$stow_flag"
        --dir "$modules_dir"
        --target "$HOME"
        "$module"
    )

    if [[ ! -d "$modules_dir/$module" ]]; then
        error "Module not found: $modules_dir/$module"
        return 1
    fi

    info "$action_label: $module"

    # Backups should only happen when stowing
    if [[ "$stow_flag" == "-R" ]]; then
        backup_stow_conflicts "$module"
    fi

    if [[ "${DRY_RUN:-false}" == true ]]; then
        stow_args=( --simulate --verbose "${stow_args[@]}" )
    fi

    stow "${stow_args[@]}"
}

handle_stow_modules() {
    local stow_flag="$1"
    local action_label="$2"
    shift 2

    for module in "$@"; do
        process_stow_module "$module" "$stow_flag" "$action_label"
    done
}

# --- Public entrypoint ---
stow_modules() {
    handle_stow_modules "-R" "Stowing" "$@"
}

unstow_modules() {
    handle_stow_modules "-D" "Unstowing" "$@"
}
