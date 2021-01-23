#!/bin/sh

read -p "Are you really really sure you want to run this script? (y/n) " response

case $response in
    y|Y|yes|Yes)
        echo "Syncing ~/Documents/osu-rclone/ to GD_OSU/manjaro-rclone/"
        rclone sync ~/Documents/osu-rclone/ GD_OSU:/manjaro-rclone/
        ;;
    *)
        echo "Okay, I'm not doing anything then"
esac
