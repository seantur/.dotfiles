#!/usr/bin/env bash

WEATHER=$(curl --silent "wttr.in/04038?format="%C+%t"")

if [[ "$WEATHER" != *"Unknown"* ]]; then
    echo "$WEATHER"
fi
