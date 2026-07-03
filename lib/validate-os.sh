#!/usr/bin/env bash

validate_os() {
    case "$os" in
        debian|arch|macos)
            return 0
            ;;
        *)
            error "Unsupported OS: $os"
            return 1
            ;;
    esac
}
