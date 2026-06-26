#!/usr/bin/env bash
# Defines shared logging helpers for consistent info and error messages

# --- Log helper functions ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

title() {
    echo -e "$GREEN \n\t--- $* ---\n"
}

info() {
    echo -e "${GREEN} INFO:${NO_COLOR} $*"
}

warn() {
    echo -e "${YELLOW} WARN:${NO_COLOR} $*"
}

error() {
    echo -e "${RED} ERROR:${NO_COLOR} $*"
}
