#!/bin/bash

set -e

trap exit SIGINT
trap exit SIGTERM

git config credential.helper '!f() { sleep 1; echo "username=${GIT_USER}"; echo "password=${GIT_PASSWORD}"; }; f'

if [ -n "$TIME_ZONE" ]; then
  cp /usr/share/zoneinfo/"$TIME_ZONE" /etc/localtime
  echo "$TIME_ZONE" > /etc/timezone
fi

if [ -z "$TIME_SERVER" ]; then
  TIME_SERVER=pool.ntp.org
fi

echo "$CRON_ENTRY" | crontab -

ntpd -p "$TIME_SERVER" && crond -f