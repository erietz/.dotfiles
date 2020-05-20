#!/bin/bash

man -k . | dmenu -l 30 | awk '{print $1}' | sed "s/[(][^)]*[)]//g"| xargs man -t | open -f -a Skim
