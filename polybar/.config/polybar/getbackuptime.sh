#!/usr/bin/env bash
datetime=$(tac /var/log/borg.log | grep -m 1 "Time (end)" | cut -d "," -f2 | xargs)
backuptime=$(date -d "$datetime" '+%s')
now=$(date '+%s')
delta=$(("$now" - "$backuptime"))

if [ "$delta" -lt 60 ]; then
    seconds="$delta"
    echo "$seconds" sec [slb]
elif [ "$delta" -lt 3600 ]; then
    minutes=$(printf "%0.2f" $(echo "$delta / 60" | bc -l))
    echo "$minutes" min [slb]
elif [ "$delta" -lt 86400 ]; then
    hours=$(printf "%0.2f" $(echo "$delta / 3600" | bc -l))
    echo "$hours" hrs [slb]
else
    hours=$(printf "%0.2f" $(echo "$delta / 86400" | bc -l))
    echo "$days" days [slb]
fi
