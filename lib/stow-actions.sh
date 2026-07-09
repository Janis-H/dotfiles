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

is_already_stowed_target() {
    local source="$1"
    local target="$2"

    [[ -e "$target" || -L "$target" ]] || return 1

    [[ "$(readlink -f "$target")" == "$(readlink -f "$source")" ]]
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

        # Target already resolves to this module file.
        # Handles both file symlinks and parent-directory symlinks.
        if is_already_stowed_target "$source" "$target"; then
            continue
        fi

        # Other symlink. Leave it alone for now.
        if [[ -L "$target" ]]; then
            warn "Skipping existing symlink: $target"
            continue
        fi

        if ! create_backup "$target"; then
            error "Failed to back up: $target"
            return 1
        fi
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

    # Backups should only happen when stowing or restowing
    if [[ "$stow_flag" == "-S" || "$stow_flag" == "-R" ]]; then
        if ! backup_stow_conflicts "$module"; then
            error "Skipping stow because backup failed: $module"
            return 1
        fi
    fi

    if [[ "${DRY_RUN:-false}" == true ]]; then
        stow_args=( --simulate --verbose "${stow_args[@]}" )
    fi

    # FIXME: Remove this stderr filter after upgrading GNU Stow.
    # Stow <= 2.3.x can emit noisy "find_stowed_path" warnings during restow.
    if ! stow "${stow_args[@]}" \
        2> >(grep -vF 'BUG in find_stowed_path? Absolute/relative mismatch' >&2)
    then
        error "Failed: $action_label $module"
        return 1
    fi
}

handle_stow_modules() {
    local stow_flag="$1"
    local action_label="$2"
    shift 2

    local module
    local failed_modules=()

    for module in "$@"; do
        if ! process_stow_module "$module" "$stow_flag" "$action_label"; then
            failed_modules+=("$module")
            continue
        fi
    done

    if (( "${#failed_modules[@]}" > 0)); then
        error "The following modules failed:"
        printf '    - %s \n' "${failed_modules[@]}" >&2
        return 1
    fi

    return 0
}

# --- Public entrypoint ---
stow_modules() {
    handle_stow_modules "-S" "Stowing" "$@"
}

unstow_modules() {
    handle_stow_modules "-D" "Unstowing" "$@"
}

restow_modules() {
    handle_stow_modules "-R" "Restowing" "$@"
}
