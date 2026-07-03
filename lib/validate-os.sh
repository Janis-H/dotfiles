#!/usr/bin/env bash

validate_os() {
    case "$os" in
        debian|arch|macos)
            ;;
        *)
            error "Unsupported OS: $os"
            exit 1
            ;;
    esac
}
