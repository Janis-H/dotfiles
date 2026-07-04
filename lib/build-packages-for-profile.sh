#!/usr/bin/env bash

build_packages_for_profile() {
    local profile="$1:-core"
    PACKAGES=("${CORE_PACKAGES[@]}")

    case "$profile" in
        core)
            ;;
        server)
            PACKAGES+=("${DEV_BUILD_PACKAGES[@]}")
            ;;
        desktop)
            PACKAGES+=(
                "${DEV_BUILD_PACKAGES[@]}"
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
