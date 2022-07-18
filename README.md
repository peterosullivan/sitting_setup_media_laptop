Media room snapcast setup
=========================

## Laptop Setup

```
sudo apt update && sudo apt upgrade && sudo apt autoremove
sudo apt install openssh-server net-tools
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


## Mount NAS Shares

`sudo apt-get install cifs-utils`

```
sudo mkdir /media/nas_movies
sudo mkdir /media/nas_music
sudo mkdir /media/nas_tv_shows
```
```
sudo echo \
"192.168.0.2:/data/Movies  /media/nas_movies nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0  0 \
192.168.0.2:/data/Music  /media/nas_music nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0  0" \
192.168.0.2:/data/TV_Shows  /media/nas_tv_show nfs rw,hard,intr,rsize=8192,wsize=8192,timeo=14 0  0" \
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

