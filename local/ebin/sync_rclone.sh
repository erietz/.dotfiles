#!/bin/sh

read -p "Are you really really sure you want to run this script? (y/n) " response

case $response in
    y|Y|yes|Yes)
        echo "Okay proceeding then"
        read -p "Do you want to push or pull (push/pull) " action
        case $action in
            push)
                echo "Syncing ~/Documents/GD_OSU_RCLONE/manjaro to GD_OSU/manjaro"
                rclone sync ~/Documents/GD_OSU_RCLONE/manjaro GD_OSU:/manjaro
                ;;
            pull)
                echo "Syncing GD_OSU/manjaro to ~/Documents/GD_OSU_RCLONE/manjaro"
                rclone sync GD_OSU:/manjaro ~/Documents/GD_OSU_RCLONE/manjaro 
                ;;
            *)
                echo "Not a valid option"
        esac
        ;;
    *)
        echo "Okay, I'm not doing anything then"
esac
