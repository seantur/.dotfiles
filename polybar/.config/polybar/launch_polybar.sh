#!/usr/bin/env bash

# Script to set the current monitors and start polybar

pkill polybar

sleep 1

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload mybar &
done
