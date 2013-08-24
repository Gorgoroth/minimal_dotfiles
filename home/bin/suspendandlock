#!/bin/bash
username=vk
userhome=/home/$username
export XAUTHORITY="$userhome/.Xauthority"
export DISPLAY=":0"

lock() {
  su vk -c "i3lock -i $userhome/.config/i3/i3lock_back.png  -t"
}

grep -q closed /proc/acpi/button/lid/LID/state
if [ $? = 0 ]
then
  lock && sudo pm-suspend-hybrid
fi
