#!/bin/bash
# https://wiki.archlinux.org/title/Polybar

# Terminate already running bar instances
# polybar-msg cmd quit
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar vertical 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Polybar launched..."
