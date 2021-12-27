#!/bin/sh

sed -i 's/colors: \*light/colors: \*dark/' /home/ethan/.config/alacritty/alacritty.yml

sed -i 's/set background=light/set background=dark/' /home/ethan/.config/nvim/after/plugin/colors.vim
