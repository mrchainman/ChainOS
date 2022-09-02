#!/bin/sh
newsboat -x reload &&
/home/void/.scripts/utils/notify.sh rss "Newsboat" "updated RSS feeds"
