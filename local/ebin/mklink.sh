#!/usr/bin/env bash

# I followed the tutorial here and it did not work at all.......
# https://shesgottadevelopit.com/2018/12/10/mklink-command-in-windows-ubuntu-wsl/

# This is extremely hacky. Creates a link to Windows directory from a WSL
# directory. One must open Command Prompt as Administrator, navigate to WSL
# and then run this script.

windows_dir=$(echo $1 | sed 's#/mnt/c/#C:\\#' | sed 's#/#\\#g')

wsl_dir=$(echo $2 | sed 's#/#\\#g')
wsl_dir='\\wsl$\Ubuntu'$wsl_dir

#echo $windows_dir
#echo $wsl_dir

cmd.exe /c "mklink /D $windows_dir $wsl_dir"
