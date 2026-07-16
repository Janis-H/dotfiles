#!/usr/bin/env bash
# Defines shared logging helpers for consistent info and error messages

# --- Log helper functions ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

section() {
    printf '\n%b\t=== %s ===%b\n\n' \
        "$GREEN" \
        "$*" \
        "$NO_COLOR"

}

info() {
    printf '%b INFO:%b %s\n' \
        "$GREEN" \
        "$NO_COLOR" \
        "$*"
}

warn() {
    printf '%b WARN:%b %s\n' \
        "$YELLOW" \
        "$NO_COLOR" \
        "$*"
}

error() {
    printf '%b WARN:%b %s\n' \
        "$RED" \
        "$NO_COLOR" \
        "$*"
}
