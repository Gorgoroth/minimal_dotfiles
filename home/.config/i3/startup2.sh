#!/bin/bash

###########################################################################
# Example auto start file for i3-wm, I execute it from i3 config with
# exec $HOME/bin/auto-start-for-i3
#
###########################################################################

TERM="urxvt"
# TERM="xterm"
VIM="vim"
BROWSER="google-chrome"
SYSMON="htop"
NETMON="iptraf"

# Wait for program coming up
wait_for_program () {
  n=0
  while true
  do
    # PID of last background command
    if xdotool search --onlyvisible --pid $!; then
        break
    else
        # 20 seconds timeout
        if [ $n -eq 20 ]; then
          xmessage "Error on executing"
          break
        else
          n=`expr $n + 1`
          sleep 1
        fi
    fi
  done
}

# First screen, primary monitor
#
# ______________________
# |                     |
# |                     |
# |                     |
# |        gvim         |
# |                     |
# |                     |
# |_____________________|

i3-msg workspace 1
gvim &
wait_for_program

# Second screen, secondary monitor
#
# ______________________
# |                     |
# |                     |
# |                     |
# |       browser       |
# |                     |
# |                     |
# |_____________________|

i3-msg workspace 2
$BROWSER &
wait_for_program

i3-msg move workspace output DVI-D-1

# --- System console and monitoring ------------------------------------------
# Third screen, tertiary monitor or primary
#
# ______________________
# |          |          |
# |  $TERM   |   htop   |
# |          |          |
# |          |----------|
# |          |          |
# |          |  iptraf  |
# |__________|__________|

i3-msg workspace 3
$TERM &
wait_for_program

i3-msg split h
$TERM -e "$SYSMON;bash" &
wait_for_program

i3-msg split v
$TERM -e "sudo $NETMON;bash" &
wait_for_program

i3-msg move workspace output LVDS-1

# Second screen, secondary monitor
#
# ______________________
# |                     |
# |                     |
# |                     |
# |        vifm         |
# |                     |
# |                     |
# |_____________________|

i3-msg workspace 4
$TERM &
wait_for_program

i3-msg move workspace output DVI-D-1

# --- Remote sessions ---------------------------------------------------------
# Fourth screen, secondary monitor, or primary
#
# ______________________
# |          |          |
# |  @atlas  |  @live   |
# |          |          |
# |----------|----------|
# |          |          |
# |  htop    |   htop   |
# |__________|__________|

i3-msg workspace 5
$TERM -e "ssh admin@qtf.selfhost.me;bash" &
wait_for_program

i3-msg split v
$TERM &
wait_for_program

i3-msg focus parent
i3-msg split h
$TERM -e "ssh root@87.106.53.203;bash" &
wait_for_program

i3-msg split v
$TERM &
wait_for_program

i3-msg move workspace output LVDS-1

# Focus the browser
workspace 2

# Need a refresh, here we go...
xrefresh &

exit 0
