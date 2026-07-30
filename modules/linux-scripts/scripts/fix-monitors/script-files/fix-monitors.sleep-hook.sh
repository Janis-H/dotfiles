#!/usr/bin/env bash

case "$1" in
  post)
    export DISPLAY=:0
    export XAUTHORITY="/home/residentgoose/Xauthority"

    su residentgoose -c '/home/residentgoose/.local/bin/fix-monitors'
    ;;
esac
