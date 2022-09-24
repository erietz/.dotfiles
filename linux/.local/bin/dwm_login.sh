#!/bin/sh
#-------------------------------------------------------------------------------
# Author      : Ethan Rietz
# Date        : 2021-10-19
# Description :
#     - Start up applications when logging into dwm.
#     - This file is sourced by xprofile.
#     - Multimedia keys are set by xfce4-power-manager and volumeicon
#-------------------------------------------------------------------------------

start_daemon() {
    pgrep -u $USER "$1" || exec "$@" &
}

# status bar
start_daemon slstatus

# system tray
start_daemon nm-applet  # network manager applet
# start_daemon pamac-tray # pamac system update applet
# start_daemon volumeicon # volume icon applet
start_daemon pa-applet # pulse audio applet

# other
start_daemon clipit                 # clipit icon
start_daemon nitrogen --restore     # wallpaper
start_daemon xfce4-power-manager    # power manager, brightness controls
start_daemon xautolock -time 10 -locker blurlock    # screen lock

