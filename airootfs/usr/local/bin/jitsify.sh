#!/bin/sh
url=$1
newurl=$(echo $url | awk -F/ '{print $4}')
jitsi-meet-desktop jitsi-meet://$newurl
