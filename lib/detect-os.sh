#!/usr/bin/env bash

function detect_os() {
    local kernel_name = "$(uname -s)"

    case "$kernel_name" in
    Darwin)
        echo "macos"
        ;;
    Linux)
        if [ -f /etc/arch-release ]; then
          echo "arch"
        elif [ -f /etc/debian_version ]; then
          echo "debian"
        else
          echo "linux-unknown"
        fi
        ;;
    *) 
        echo "unsupported"
        ;;
    esac
}
