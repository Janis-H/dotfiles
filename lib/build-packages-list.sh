#!/usr/bin/env bash

build_packages_list() {
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
            exit 1
            ;;
    esac
}
