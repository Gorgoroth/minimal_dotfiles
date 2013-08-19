#!/bin/sh

# TODO Find a better place for this
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Manage multiple monitors
# TODO is there an elegant method for handling some monitors not being there?
xrandr --output LVDS-1 --mode 1920x1200 --pos 0x0 --primary --output DVI-D-1 --mode 1920x1200 --pos 0x-1200

# Set Volume to a defined level
# pactl set-sink-volume 0 '20%' &
# Sound indicator applet
# volti &
# volumeicon &
obmixer &

# Clipboard manager
clipit &

# Multi-media control mapping
xmodmap .Xmodmap

# Disable screensaver
xset -dpms
xset s off
xset s noblank

# TODO Due to a bug, grp:toggle is not read from /etc/defaults/keyboars, so toggle keyboard layouts here
setxkbmap -option "grp:alt_shift_toggle" -layout "us,de"

# Enforce correct locales from the beginning
unset LC_COLLATE
export LC_CTYPE=de_DE.UTF-8
export LC_TIME=de_DE.UTF-8
export LC_NUMERIC=de_DE.UTF-8
export LC_MONETARY=de_DE.UTF-8
export LC_MESSAGES=C
export LC_PAPER=de_DE.UTF-8
export LC_NAME=de_DE.UTF-8
export LC_ADDRESS=de_DE.UTF-8
export LC_TELEPHONE=de_DE.UTF-8
export LC_MEASUREMENT=de_DE.UTF-8
export LC_IDENTIFICATION=de_DE.UTF-8

# OSD
# dunst &

# Dropbox
dropbox start

# Background
~/.fehbg

DEFAULT_SESSION=i3
case $1 in
  i3)
    exec i3
    ;;
  *)
    exec $DEFAULT_SESSION
    ;;
esac
