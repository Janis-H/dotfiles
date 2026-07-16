#!/usr/bin/env bash
# Defines shared logging helpers for consistent info and error messages

# --- Log helper functions ---
SECTION_COLOR='\033[1;94m'
GREEN='\033[0;32m'  # Info/success
YELLOW='\033[1;33m' # Warnings
RED='\033[0;31m'    # Errors
RESET='\033[0m'     # Reset formatting

section() {
    printf '\n%b\t=== %s ===%b\n\n' \
        "$SECTION_COLOR" \
        "$*" \
        "$RESET"

}

info() {
    printf '%b INFO:%b %s\n' \
        "$GREEN" \
        "$RESET" \
        "$*"
}

warn() {
    printf '%b WARN:%b %s\n' \
        "$YELLOW" \
        "$RESET" \
        "$*"
}

error() {
    printf '%b WARN:%b %s\n' \
        "$RED" \
        "$RESET" \
        "$*"
}
