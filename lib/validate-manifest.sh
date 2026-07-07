#!/usr/bin/env bash

LIB_DIR="$(cd -- "$(dirname -- ${BASH_SOURCE[0]})" && pwd)"

# shellcheck source="lib/require-array.sh"
source "$LIB_DIR/require-array.sh"

validate_manifest() {
    require_array CORE_PACKAGES || return 1
    require_array DEV_BUILD_PACKAGES || return 1
    require_array DESKTOP_PACKAGES || return 1

    require_array EXTERNAL_CORE || return 1
    require_array EXTERNAL_DEV_BUILD || return 1
    require_array EXTERNAL_DESKTOP || return 1

    require_array CORE_STOW_MODULES || return 1
    require_array DEV_BUILD_STOW_MODULES || return 1
    require_array DESKTOP_STOW_MODULES || return 1

    # TODO: add validation for EXTERNAL array values
    #       - each value should have an existing function in
    #         installers/external/<detected-os>.sh)
}
