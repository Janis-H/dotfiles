#!/usr/bin/env bash

# message dimensions
HEIGHT=100
WIDTH=400

function display_info_message() {
    local text="$1"

    # if no argument passed, exit
    if [[ $# -eq 0 ]]; then
        echo "No arguments supplied." >&2
        exit 0
    fi

    # display info message
    zenity \
        --info \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        --text="$text"
}
