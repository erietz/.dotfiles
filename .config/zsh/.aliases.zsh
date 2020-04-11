back() {
	local string=""
	for i in {1..$1}
		string+=$(printf "../")
	cd $string
}

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias jlremote="jupyter lab --no-browser --port=9876"
