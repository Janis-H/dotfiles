#!/usr/bin/env bash
 
# --- Log helper functions ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

function info() {
    echo -e "${GREEN} INFO:${NO_COLOR} $*"
}

function warn() {
    echo -e "${YELLOW} WARN:${NO_COLOR} $*"
}

function error() {
    echo -e "${RED} ERROR:${NO_COLOR} $*"
}
