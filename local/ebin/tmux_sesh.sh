#!/bin/sh

tmux new-session -s my_sesh -n main -c $HOME -d
tmux new-window -t my_sesh:2 -n email -c $HOME -d 
tmux send-keys -t my_sesh:email 'neomutt' Enter
tmux attach -t my_sesh
