#!/usr/bin/env python
from datetime import datetime
import sys

from file_read_backwards import FileReadBackwards

log_file = '/var/log/borg.log'

with FileReadBackwards(log_file, encoding='utf-8') as f:

    date_str = ""

    while True:
        line = f.readline()
        if not line:
            break
        if 'Backup created.' in line:
            date_str = line.split('-')[0].strip()
            break

date = datetime.strptime(date_str, "%a %d %b %Y %I:%M:%S %p %Z")
delta = datetime.now() - date

delta_seconds = delta.days*86399 + delta.seconds

if delta_seconds < 0:
    seconds = round(delta_seconds, 2)
    print(f"[{seconds} sec]")
elif delta_seconds < 3600:
    minutes = round(delta_seconds / 60, 2)
    print(f"[{minutes} min]")
elif delta_seconds < 86400:
    hours = round(delta_seconds / 3600, 2)
    print(f"[{hours} hrs]")
else:
    days = round(delta_seconds / 86400)
    print(f"[{days} days]")
