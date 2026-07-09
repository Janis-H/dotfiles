#!/usr/bin/env bash

build_external_tools_for_profile() {
    local profile="${1:-desktop}"

    EXTERNAL_TOOLS=()

    case "$profile" in
        core)
            EXTERNAL_TOOLS=(
                "${EXTERNAL_CORE[@]}"
            )
            ;;
        headless)
            EXTERNAL_TOOLS+=(
                "${EXTERNAL_CORE[@]}"
                "${EXTERNAL_HEADLESS[@]}"
            )
            ;;
        desktop)
            EXTERNAL_TOOLS+=(
                "${EXTERNAL_CORE[@]}"
                "${EXTERNAL_HEADLESS[@]}"
                "${EXTERNAL_DESKTOP[@]}"
            )
            ;;
        *)
            echo "Unsupported profile: $profile" >&2
            print_usage >&2
            return 1
            ;;
    esac
}
