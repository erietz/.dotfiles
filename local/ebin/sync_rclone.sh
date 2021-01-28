#!/bin/sh

read -p "Are you really really sure you want to run this script? (y/n) " response

case $response in
    y|Y|yes|Yes)
        echo "Syncing ~/Documents/GD_OSU_RCLONE/manjaro to GD_OSU/manjaro"
        rclone sync ~/Documents/GD_OSU_RCLONE/manjaro GD_OSU:/manjaro
        ;;
    *)
        echo "Okay, I'm not doing anything then"
esac
