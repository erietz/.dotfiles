function reload-background
	# tmux
	tmux set-environment -g BACKGROUND "$BACKGROUND"
	tmux source ~/.config/tmux/tmux.conf

	# fish
	if test $BACKGROUND = "light"
		fish_config theme choose "Tomorrow"
	else if test $BACKGROUND = "dark"
		fish_config theme choose "Tomorrow Night"
	end

	# ghostty
	
	# neovim
end
