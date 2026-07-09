#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing run-command.sh}"

source "$DOTFILES_DIR/lib/print-command.sh"

run_cmd() {
    print_command "$@"

    if [[ "${DRY_RUN:-false}" == true ]]; then
        return 0
    fi

    "$@"
}
