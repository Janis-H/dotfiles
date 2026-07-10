#!/usr/bin/env bash

print_list() {
    local item

    for item in "$@"; do
        printf '        - %s\n' "$item"
    done
}
