#!/bin/bash

set -e

trap exit SIGINT
trap exit SIGTERM

if [ -n "$TIME_ZONE" ]; then
  cp /usr/share/zoneinfo/"$TIME_ZONE" /etc/localtime
  echo "$TIME_ZONE" > /etc/timezone
fi

if [ -z "$TIME_SERVER" ]; then
  TIME_SERVER=pool.ntp.org
fi

echo "$CRON_ENTRY" | crontab -

ntpd -p "$TIME_SERVER" && crond -f