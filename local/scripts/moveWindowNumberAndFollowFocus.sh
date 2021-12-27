#!/bin/dash

space=$1

[ "$space" -gt 0 ] || echo "Error: enter an integer" || exit 0

curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

yabai -m window --space "$space" && yabai -m window --focus "$curWindowId"
