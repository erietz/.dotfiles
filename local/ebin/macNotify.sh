#!/bin/sh

TITLE=$1
MESSAGE=$2

#osascript -e 'display notification "hello world!"'
osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\""
#osascript -e 'display notification "hello world!" with title "Greeting" subtitle "More text"'
