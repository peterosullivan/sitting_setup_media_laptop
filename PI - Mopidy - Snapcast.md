# Raspberry - Mopidy - Snapcast Setup Guide

## Pi setup
Install `2020-08-20-raspios-buster-armhf-lite.img`

enable SSH

`ssh-copy-id pi@192.168.0.XX`

Increase file disk size `sudo raspi-config`

`sudo apt update && sudo apt upgrade`

`sudo apt install vim`


## Install Mopidy

`wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -`

`sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list`

`sudo apt update`

`sudo apt install mopidy mopidy-mpd python3-pip`


### Config

Show `sudo mopidyctl config`

`sudo vim /etc/mopidy/mopidy.conf`
```
[http]
hostname = 0.0.0.0

[local]
media_dir = /home/pi/music

[mpd]
hostname = ::

[audio]
output =  audioresample ! audio/x-raw,rate=48000,channels=2,format=S16LE ! audioconvert ! wavenc ! filesink location=/tmp/snapfifo
```
### Sart on boot

Start mopidy on boot `sudo dpkg-reconfigure mopidy`

Check status `sudo service mopidy status`

### Mopidy Plugins

List of plugins `sudo apt search mopidy`

`sudo python3 -m pip install Mopidy-Iris Mopidy-Mobile mopidy-local mopidy-podcast Mopidy-Podcast-iTunes`

Plugin for playing local MP3's

### Copy NAS music to PI
Copy NAS's SSH Public Key to PI  `~/.ssh/authorized_keys`

Make dir `mkdir music`

Run NAS `backup` to rsync the music over

Scan the local dir `sudo mopidyctl local scan`

## Snapcast Server

Download `wget https://github.com/badaix/snapcast/releases/download/v0.20.0/snapserver_0.20.0-1_armhf.deb`

Install
`sudo dpkg -i snapserver_0.20.0-1_armhf.deb`

Install dependencies  `sudo apt-get -f install` 


`sudo systemctl status snapserver`

`sudo service snapserver status`

Start on boot `sudo update-rc.d snapserver defaults`

`sudo su`

Add this to `/etc/mopidy/mopidy.conf` to
redirect/Pipe audio to Snapcast fifo (first in first out) file
```
[audio]
output =  audioresample ! audio/x-raw,rate=48000,channels=2,format=S16LE ! audioconvert ! wavenc ! filesink location=/tmp/snapfifo
```

echo "[audio]
 audio/> output =  audioresample ! audio/x-raw,rate=48000,channels=2,format=S16LE ! audioconvert ! wavenc ! filesink location=/tmp/snapfifo
> " >> /etc/mopidy/mopidy.conf

## Snapclient


`wget https://github.com/badaix/snapcast/releases/download/v0.20.0/snapclient_0.20.0-1_armhf.deb`

`sudo dpkg -i snapclient_0.20.0-1_armhf.deb`

Install dependencies  `sudo apt-get -f install` 

Check status `sudo systemctl status snapclient`


