#!/usr/bin/env bash

validate_profile() {
    local profile="$1"

    case "$profile" in
        core|server|desktop)
            ;;
        *)
            error "Invalid profile option: $profile"
            print_usage
            exit 1
    esac
}
