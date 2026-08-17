#!/usr/bin/env bash

is_supported_linux_os() {
    local os="$1"

    case "$os" in

        arch | fedora | debian)
            if ! declare -F run_common_linux_post_install >/dev/null; then
                error "Missing post-install function: run_common_linux_post_install"
                return 1
            fi
            ;;
    esac
}
