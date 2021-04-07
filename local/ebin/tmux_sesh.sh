#!/bin/sh

tmux new-session -s gitRdone -n random -c $HOME -d
tmux new-window -t gitRdone:2 -n email -c $HOME -d 
tmux send-keys -t gitRdone:email 'neomutt' Enter
tmux attach -t gitRdone
