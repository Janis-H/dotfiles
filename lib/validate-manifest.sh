#!/usr/bin/env bash

LIB_DIR="$(cd -- "$(dirname -- ${BASH_SOURCE[0]})" && pwd)"

# shellcheck source="lib/require-array.sh"
source "$LIB_DIR/require-array.sh"

validate_manifest() {
    local os="$1"

    require_array CORE_PACKAGES || return 1
    require_array HEADLESS_PACKAGES || return 1
    require_array DESKTOP_PACKAGES || return 1

    require_array EXTERNAL_CORE || return 1
    require_array EXTERNAL_HEADLESS || return 1
    require_array EXTERNAL_DESKTOP || return 1

    require_array CORE_STOW_MODULES || return 1
    require_array HEADLESS_STOW_MODULES || return 1
    require_array DESKTOP_STOW_MODULES || return 1

    if [[ "$os" == "macos" ]]; then
        require_array DESKTOP_CASKS || return 1
    fi

    # TODO: add validation for EXTERNAL array values
    #       - each value should have an existing function in
    #         installers/external/<detected-os>.sh)
}
