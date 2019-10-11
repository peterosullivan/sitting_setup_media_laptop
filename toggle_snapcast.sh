#!/bin/bash
SERVICE="snapclient"
if pgrep -x "$SERVICE" >/dev/null
then
  echo "Stopping $SERVICE"
  pkill snapclient
else
  echo "Start $SERVICE"
  x-terminal-emulator  -e 'pactl set-card-profile 0 output:hdmi-stereo'
  x-terminal-emulator  -e 'snapclient -h 192.168.0.4'
fi