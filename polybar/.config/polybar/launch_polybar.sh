#!/usr/bin/env bash

# Script to set the current monitors and start polybar

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --listmonitors | grep "+" | cut -d" " -f6); do
    MONITOR=$m polybar --reload $1 &
done
