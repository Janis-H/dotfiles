#!/usr/bin/env bash

build_external_tools_for_profile() {
    local profile="${1:-core}"

    EXTERNAL_TOOLS=("${EXTERNAL_CORE[@]}")

    case "$profile" in
        core)
            ;;
        headless)
            EXTERNAL_TOOLS+=("${EXTERNAL_HEADLESS[@]}")
            ;;
        desktop)
            EXTERNAL_TOOLS+=(
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
