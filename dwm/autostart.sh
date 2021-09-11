#!/bin/sh

# status bar
./dwm_status &

# system tray
nm-applet &   # network manager applet
pa-applet &   # pulse audio applet
pamac-tray &  # pamac system update applet
# volumeicon  # volumn icon applet

# other startup programs
clipit &      # clipit icon
