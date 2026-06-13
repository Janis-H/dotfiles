#!/usr/bin/env bash
# Defines the OS detection helpers used to select the correct install and stow behavior
: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing detect-os.sh}"

detect_os() {
    local kernel_name="$(uname -s)"

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
