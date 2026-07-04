#!/usr/bin/env bash

LIB_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source="lib/log.sh"
source "$LIB_DIR/log.sh"

install_external_tools() {
    local tool install_func

    # loop through arg array
    for tool in "$@"; do
        install_func="install_external_${tool}"

        # TODO: add shared lib validate_function for validating functions

        # validate that install_function exists
        if ! declare -F "$install_func" >/dev/null; then
            error "Missing external installer: $install_func"
            return 1
        fi

        # run install function
        "$install_func"
    done
}
