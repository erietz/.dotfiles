#!/bin/sh

man -k . | fzf | awk '{print $1}' | sed "s/[(][^)]*[)]//g"| xargs man -t | open -f -a Skim
