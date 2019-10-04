Media room snapcast setup
=========================

Interesting commands
--------------------
`
sudo apt install gnome-disk-utility
sudo apt install net-tools
sudo apt-get install build-essential
sudo apt-get install libasound2-dev libvorbisidec-dev libvorbis-dev libflac-dev alsa-utils libavahi-client-dev avahi-daemon
/etc/default/snapclient
sudo dpkg -i snapclient_0.15.0-1_amd64.deb 
/etc/default/snapclient
sudo /etc/default/snapclient
sudo /etc/default/snapclient -h
rm snapclient_0.15.0-1_amd64.deb 
sudo snap install htop
sudo apt install vim
sudo systemctl disable snapclient
`

HDMI setup
----------------------------
Force Ubuntu to use HDMI audio output

This command makes it easier to see what my actual output options are:

`pacmd list-cards | grep output\:`

That way of looking at the output of pacmd list-cards made me realize that the actual wording for my output is not output:hdmi-output but instead output:hdmi-stereo

This command is what worked for me:

`pactl set-card-profile 0 output:hdmi-stereo`

This is how I switched back to my laptop's internal speakers:

`pactl set-card-profile 0 output:analog-stereo`

This is how I changed the volume via command line:

`amixer -D pulse sset Master 50%`
