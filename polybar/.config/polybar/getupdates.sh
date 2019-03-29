#!/usr/bin/env bash
# Script to output the number of package updates

NUM=$(checkupdates | wc -l)

if [[ "$NUM" == 0 ]]; then
    echo -e "∅"
elif [[ "$NUM" == 1 ]]; then
    UPDATE=$(checkupdates)
    read -r PACKAGE <<< "$UPDATE"
    echo -e "1 ($PACKAGE)"
else
    echo -e "$NUM"
fi
