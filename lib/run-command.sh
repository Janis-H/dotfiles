#!/usr/bin/env bash

run_cmd() {
    # print intended command
    printf '+'
    printf ' %q' "$@"
    printf '\n'

    # if DRY_RUN=true, exit without running
    if [[ "${DRY_RUN:-false}" == true ]]; then
        return 0
    fi

    # run command
    "$@"
}
