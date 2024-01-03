#!/usr/bin/env bash
# Script to output the artist / title of the current spotify song

OUTPUT=$($HOME/.config/polybar/spmd -P "<paused>" -S "" "%title - %artist")
SIZE=${#OUTPUT}

if (( $SIZE > 40 )); then
   echo $(echo $OUTPUT | cut -c 1-25)...
elif (( $SIZE > 2 )); then
   echo $OUTPUT
fi
