#!/usr/bin/env bash

# Script to set the current monitors and start polybar

killall -q polybar

while pgrep iu $UID -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload $1 &
done
