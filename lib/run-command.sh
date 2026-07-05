#!/usr/bin/env bash

run_cmd() {
    if [[ "${DRY_RUN:-false}" == true ]]; then
        return 0
    fi

    "$@"
}
