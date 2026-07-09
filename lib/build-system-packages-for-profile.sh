#!/usr/bin/env bash

build_system_packages_for_profile() {
    local profile="${1:-desktop}"

    SYSTEM_PACKAGES=()

    case "$profile" in
        core)
            SYSTEM_PACKAGES=(
                "${CORE_PACKAGES[@]}"
            )
            ;;
        headless)
            SYSTEM_PACKAGES+=(
                "${CORE_PACKAGES[@]}"
                "${HEADLESS_PACKAGES[@]}"
            )
            ;;
        desktop)
            SYSTEM_PACKAGES+=(
                "${CORE_PACKAGES[@]}"
                "${HEADLESS_PACKAGES[@]}"
                "${DESKTOP_PACKAGES[@]}"
            )
            ;;
        *)
            echo "Unsupported profile: $profile" >&2
            print_usage >&2
            return 1
            ;;
    esac
}
