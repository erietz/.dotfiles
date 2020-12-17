alias \
	ls="ls --color=auto" \
	spotify="spotify --force-device-scale-factor=2 &> /dev/null & disown" \
	keybindings='grep "bindsym \$mod+" .config/i3/config | fzf' \

old_trusty_files=(
	/usr/share/fzf/key-bindings.zsh
	/usr/share/fzf/completion.zsh
	)

load_configs $old_trusty_files
