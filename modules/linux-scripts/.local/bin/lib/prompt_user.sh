#!/usr/bin/env bash

# message dimensions
HEIGHT=100
WIDTH=400

function prompt_user() {
    local text="$1"

    # if no argument passed, exit
    if [[ $# -eq 0 ]]; then
        echo "No arguments supplied." >&2
        exit 0
    fi

    # prompt user
    zenity \
        --entry \
        --width="$WIDTH" \
        --height="$HEIGHT" \
        --title="Input Required" \
        --text="$text"
}
