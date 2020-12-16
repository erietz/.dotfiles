#!/usr/bin/env zsh

ROOTDIR=/Applications
APPS=($(find /Applications -maxdepth 2 -name "*.app"))
#APPS=(${ROOTDIR}/**/*.app)

SELECTION=$(print -l ${APPS:t} | choose)
#
#SELECTION="TEST"

if [ -z $SELECTION ]
then
    exit 0
else
    open ${ROOTDIR}/${SELECTION}
fi
