#!/usr/bin/env zsh

websites=(
    "https://github.iu.edu/"
    "https://gitlab.com/"
    )

print -l $websites| fzf | xargs open -a $BROWSER
