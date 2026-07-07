#!/usr/bin/env bash

build_external_tools_for_profile() {
    local profile="${1:-core}"

    EXTERNAL_TOOLS=("${EXTERNAL_CORE[@]}")

    case "$profile" in
        core)
            ;;
        server)
            EXTERNAL_TOOLS+=("${EXTERNAL_DEV_BUILD[@]}")
            ;;
        desktop)
            EXTERNAL_TOOLS+=(
                "${EXTERNAL_DEV_BUILD[@]}"
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
