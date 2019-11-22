#!/usr/bin/env bash

# Script to set the current monitors and start polybar

LAPTOP="eDP1"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ "$1" = "mobile" ]; then
    polybar --reload laptop &
elif [ "$1" = "docked" ]; then
    polybar --reload main &
    polybar --reload vertical &
    polybar --reload laptop &
fi
