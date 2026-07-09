#!/usr/bin/env bash

build_default_modules_for_profile() {
    local profile="${1:-core}"

    DEFAULT_MODULES=()

    case "$profile" in
        core)
            DEFAULT_MODULES+=(
                "${CORE_STOW_MODULES[@]}"
            )
            ;;
        headless)
            DEFAULT_MODULES+=(
                "${CORE_STOW_MODULES[@]}"
                "${HEADLESS_STOW_MODULES[@]}"
            )
            ;;
        desktop)
            DEFAULT_MODULES+=(
                "${CORE_STOW_MODULES[@]}"
                "${HEADLESS_STOW_MODULES[@]}"
                "${DESKTOP_STOW_MODULES[@]}"
            )
            ;;
        *)
            echo "Unsupported profile: $profile" >&2
            print_usage >&2
            return 1
            ;;
    esac
}
