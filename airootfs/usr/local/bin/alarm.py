#!/usr/bin/env python3

"""Notify for all Khal events in advance.

According to the set NOTIFY_MINS (list of minutes in advance to get a
notification).
"""

import datetime
import re
from typing import List, Pattern

from sh import khal, notify_send

NOTIFY_MINS: List[int] = [1, 5, 15, 60]

events: str = str(khal("list", "--notstarted", "today", "today", _tty_out=False))
regex: Pattern = re.compile("^([0-9]{2}:[0-9]{2})-([0-9]{2}:[0-9]{2}) (.*)$")
now: datetime.time = datetime.datetime.now().time()

for line in events.split("\n"):
    matches: List[str] = regex.findall(line)
    if len(matches) != 1:
        continue

    start: datetime.time = datetime.time(*tuple(map(int, matches[0][0].split(":"))))
    end: datetime.time = datetime.time(*tuple(map(int, matches[0][1].split(":"))))
    if " :: " in matches[0][2]:
        title, description = matches[0][2].split(" :: ")
    else:
        title = matches[0][2]
    remaining = datetime.datetime.combine(
        datetime.date.min, start
    ) - datetime.datetime.combine(datetime.date.min, now)
    remaining_minutes: int = round(remaining.total_seconds() / 60)
    print(remaining_minutes)
    if remaining_minutes in NOTIFY_MINS:
        notify_send(
            f"Upcoming calendar event: {title}",
            f"{matches[0][0]}-{matches[0][1]} in {remaining_minutes} mins.",
        )
