alias \
	ls="ls --color=auto" \
	spotify="spotify --force-device-scale-factor=2 &> /dev/null & disown" \
	keybindings='grep "bindsym \$mod+" .config/i3/config | fzf' \
