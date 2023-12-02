#!/usr/bin/env bash

# Script to set the current monitors and start polybar


killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ "$1" = "mobile" ]; then
    polybar --reload laptop &
elif [ "$1" = "docked" ]; then
    MAIN_MONITOR="DP1-2"
    polybar --reload main &
    polybar --reload vertical &
    polybar --reload laptop &
elif [ "$1" = "main" ]; then
    polybar --reload main &
elif [ "$1" = "home" ]; then
    MAIN_MONITOR="HDMI1"
    polybar --reload main &
    polybar --reload laptop &
fi
