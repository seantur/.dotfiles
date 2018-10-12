#!/usr/bin/env bash
datetime=$(tac /var/log/borg.log | grep -m 1 "Time (end)" | cut -d "," -f2 | xargs)
backuptime=$(date -d "$datetime" '+%s')
now=$(date '+%s')
delta=$(("$now" - "$backuptime"))

if [ "$delta" -lt 60 ]; then
    echo "$delta" seconds since last backup
elif [ "$delta" -lt 3600 ]; then
        echo "$(( "$delta" / 60))"."$(( "$delta" % 60 ))" minutes since last backup
elif [ "$delta" -lt 86400 ]; then 
    echo "$(("$delta" / 3600))"."$(( "$delta" % 3600 ))" hours since last backup
else
    echo "$(("$delta" / 86400 ))"."$(( "$delta" % 3600 ))" days since last backup
fi
