#!/usr/bin/env bash

summary="$1"
text="$2"

# send temporary desktop notification
notify-send -e "$summary" "$text"
