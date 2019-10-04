#!/usr/bin/env bash
x-terminal-emulator  -e 'pactl set-card-profile 0 output:hdmi-stereo'

#x-terminal-emulator  -e 'snapclient -h volumio.local'
x-terminal-emulator  -e 'snapclient -h 192.168.0.4'
#x-terminal-emulator -e 'snapclient start'
