#!/bin/sh

start_process_if_not_running() {
    pgrep "$@" || "$@" &
}

# status bar
start_process_if_not_running ~/.local/ebin/dwm_status

# system tray
start_process_if_not_running nm-applet  # network manager applet
# start_process_if_not_running pa-applet # pulse audio applet
start_process_if_not_running pamac-tray # pamac system update applet
start_process_if_not_running volumeicon # volumn icon applet

# other startup programs
start_process_if_not_running clipit                 # clipit icon
start_process_if_not_running nitrogen --restore     # wallpaper
