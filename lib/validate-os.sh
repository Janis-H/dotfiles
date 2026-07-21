#!/usr/bin/env bash

validate_os() {
    local os="$1"

    case "$os" in
        arch | debian | fedora | macos)
            ;;
        *)
            error "Unsupported OS: $os"
            return 1
            ;;
    esac
}
