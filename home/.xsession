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

# TODO Due to a bug, grp:toggle is not read from /etc/defaults/keyboards, so toggle keyboard layouts here
setxkbmap -option "grp:alt_shift_toggle" -layout "us,de"

# Enforce correct locales from the beginning
LANG=de_DE.UTF-8
export LANG

unset LC_COLLATE
export LC_ALL=$LANG
export LC_CTYPE=$LANG
export LC_TIME=$LANG
export LC_NUMERIC=$LANG
export LC_MONETARY=$LANG
export LC_MESSAGES=C
export LC_PAPER=$LANG
export LC_NAME=$LANG
export LC_ADDRESS=$LANG
export LC_TELEPHONE=$LANG
export LC_MEASUREMENT=$LANG
export LC_IDENTIFICATION=$LANG
export LC_LANG="en_US.UTF-8"

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
