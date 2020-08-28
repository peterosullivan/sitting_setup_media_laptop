Media room snapcast setup
=========================

## Laptop Setup

```
sudo apt update && sudo apt upgrade && sudo apt autoremove`

sudo apt install openssh-server net-tools
ssh-copy-id peter@192.168.0.20

sudo apt install gnome-disk-utility
sudo apt-get install build-essential

sudo snap install htop
sudo apt install vim git
```


### Cursor Size 
```
Change cursor size
24: Default
32: Medium
48: Large
64: Larger
96: Largest
```

Get: `gsettings get org.gnome.desktop.interface cursor-size`

Set: `gsettings set org.gnome.desktop.interface cursor-size [sizeInPixels]`

### Cursor Color
'Adwaita' is the default Ubuntu

`gsettings get org.gnome.desktop.interface cursor-theme`

`gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-White'`


## Snapcast

`wget https://github.com/badaix/snapcast/releases/download/v0.20.0/snapclient_0.20.0-1_amd64.deb`

`sudo apt install ./snapclient_0.20.0-1_amd64.deb`

`sudo systemctl disable snapclient`

`snapclient`

`snapclient -h 192.168.0.4 -s hdmi`

## Mount NAS Shares

`sudo apt-get install cifs-utils`

```
sudo mkdir /media/movies
sudo mkdir /media/music
```
```
sudo echo \
"192.168.0.2:/data/Movies  /media/movies nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0  0 \
192.168.0.2:/data/Music  /media/music nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0  0" \
>> /etc/fstab2
```

`sudo mount -a`

## HDMI setup

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

