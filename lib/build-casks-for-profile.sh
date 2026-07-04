#!/usr/bin/env bash

build_casks_for_profile() {
    local profile="$1:-core"

    CASKS=()

    if [[ "$os" != "macos" ]]; then
        return 0
    fi

    case "$profile" in
        core|server)
            ;;
        desktop)
            CASKS+=(
                "${DESKTOP_CASKS[@]}"
            )
            ;;
        *)
            echo "Unsupported profile: $profile" >&2
            print_usage >&2
            return 1
            ;;
    esac
}
