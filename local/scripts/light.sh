#!/bin/sh

sed -i 's/colors: \*dark/colors: \*light/' /home/ethan/.config/alacritty/alacritty.yml

sed -i 's/set background=dark/set background=light/' /home/ethan/.config/nvim/after/plugin/colors.vim
