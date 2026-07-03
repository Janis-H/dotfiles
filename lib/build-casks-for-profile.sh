#!/usr/bin/env bash

build_casks_for_profile() {
    CASKS=()

    if [[ "$os" != "macos" ]]; then
        return 0
    fi

    case "$PROFILE" in
        core|server)
            ;;
        desktop)
            CASKS+=(
                "${DESKTOP_CASKS[@]}"
            )
            ;;
        *)
            echo "Unsupported profile: $PROFILE" >&2
            print_usage >&2
            return 1
            ;;
    esac
}
