# Snapclient PI Raspbian Setup

## Interestng articles
https://oyvn.github.io/multi-room-audio-with-snapcast#snapnet
https://github.com/stijnvdb88/Snap.Net

## PI Setup

Install Raspbian lite

`sudo apt update && sudo apt upgrade && sudo apt autoremove`

`sudo apt install wget vim net-tools`

Enable Wifi and SSH `sudo raspi-config`

### Install SSH

Use `sudo raspi-config`

or manually

```
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh
ssh-copy-id pi@IP_ADDRESS
```

## Snapclient

### Install

Download `wget https://github.com/badaix/snapcast/releases/download/v0.20.0/snapclient_0.20.0-1_armhf.deb`

Install `sudo apt install ./snapclient_0.20.0-1_armhf.deb`

### Playback soundcard

List soundcards `snapclient -l`

List playback devices `aplay -l`

Use `-s [soundname/index]` in this `/etc/default/snapclient` to set playback card/device


### Set default playback

Set audio for `PCM` or `HDMI` device

`amixer -M sget HDMI`

`amixer -M sset HDMI 50%`