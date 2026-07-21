#!/usr/bin/env bash
# Shared OS detection helper used to select the correct install and stow behavior

detect_linux_distro() {
    if [[ ! -r /etc/os-release ]]; then
        echo "linux-unknown"
        return
    fi

    # shellcheck disable=SC1091
    source /etc/os-release

    case "${ID:-}" in
        arch | cachyos)
            echo "arch"
            ;;
        fedora)
            echo "fedora"
            ;;
        debian | ubuntu | linuxmint)
            echo "debian"
            ;;
        *)
            echo "linux-unknown"
            ;;
    esac
}

detect_os() {
    local kernel_name
    kernel_name="$(uname -s)"

    case "$kernel_name" in
    Darwin)
        echo "macos"
        ;;
    Linux)
        detect_linux_distro
        ;;
    *)
        echo "unsupported"
        ;;
    esac
}
