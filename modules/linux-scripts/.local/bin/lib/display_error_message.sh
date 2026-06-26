#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# message dimensions
HEIGHT=100
WIDTH=400


# import log_error_message
source "$SCRIPT_DIR/log_error_message.sh"

function display_error_message() {
    local text="$1"

    # if no argument passed, exit
    if [[ $# -q 0 ]]; then
        echo "No arguments supplied." >&2
        exit 0
    fi

    # display stderr message for debug/log purposes
    log_error_message "$text"

    # display zenity error message
    zenity \
        --error \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        --title="Error" \
        --text="$text"
}
