#!/usr/bin/env bash

build_packages_for_profile() {
    PACKAGES=("${CORE_PACKAGES[@]}")

    case "$PROFILE" in
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
            echo "Unsupported profile: $PROFILE" >&2
            print_usage >&2
            return 1
            ;;
    esac
}
