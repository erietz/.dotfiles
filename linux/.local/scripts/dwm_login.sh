#!/bin/sh
#-------------------------------------------------------------------------------
# Author      : Ethan Rietz
# Date        : 2021-10-19
# Description :
#     - Start up applications when logging into dwm.
#     - This file is sourced by xprofile.
#     - Multimedia keys are set by xfce4-power-manager and volumeicon
#-------------------------------------------------------------------------------

start_if_not_running() {
    pgrep "$@" || "$@" &
}

# status bar
start_if_not_running slstatus

# system tray
start_if_not_running nm-applet  # network manager applet
# start_if_not_running pamac-tray # pamac system update applet
start_if_not_running volumeicon # volume icon applet
# start_if_not_running pa-applet # pulse audio applet

# other
start_if_not_running clipit                 # clipit icon
start_if_not_running nitrogen --restore     # wallpaper
start_if_not_running xfce4-power-manager    # power manager, brightness controls
start_if_not_running xautolock -time 10 -locker blurlock    # screen lock

