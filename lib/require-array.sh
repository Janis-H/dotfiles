#!/usr/bin/env bash

require_array() {
    local name="$1"

    local declare_array_regex='^declare \-[^ ]*a'

    if ! declare -p "$name" 2>/dev/null | grep -q "$declare_array_regex"; then
        echo "Expected indexed array: $name" >&2
        return 1
    fi
}

