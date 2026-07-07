#!/usr/bin/env bash

validate_os() {
    case "$OS" in
        debian|arch|macos)
            return 0
            ;;
        *)
            error "Unsupported OS: $OS"
            return 1
            ;;
    esac
}
