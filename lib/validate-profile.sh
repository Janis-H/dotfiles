#!/usr/bin/env bash

validate_profile() {
    local profile="$1"

    case "$profile" in
        core|server|desktop)
            return 0
            ;;
        *)
            error "Invalid profile option: $profile"
            print_usage
            return 1
    esac
}
