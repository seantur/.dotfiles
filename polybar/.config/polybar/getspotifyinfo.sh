#!/usr/bin/env bash
# Script to output the artist / title of the current spotify song

OUTPUT=$(/opt/bin/spotify-now -i "%artist - %title" -e " ")
SIZE=${#OUTPUT}

if (( $SIZE > 40 )); then
   echo $(echo $OUTPUT | cut -c 1-25)...
elif (( $SIZE > 2 )); then
   echo $OUTPUT
else
   echo ""
fi
