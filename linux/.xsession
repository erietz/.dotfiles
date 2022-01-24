#!/bin/bash
#-------------------------------------------------------------------------------
# Author      : Ethan Rietz
# Date        : 2022-01-24
# Description : Set screen dpi on a per computer basis
#   - This file is sourced by the lightdm display manager
#   - This file is sourced after ~/.xprofile and after ~/.Xresources
#   - See /etc/lightdm/Xsession for details
#-------------------------------------------------------------------------------

[[ -f ~/.Xresources-extra ]] && xrdb -merge ~/.Xresources-extra
