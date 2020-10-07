config_file="$HOME/.config/fuzzy/config.json"

b () {
	local string=""
	for i in {1..$1}
		string+=$(printf "../")
	cd $string
}

newscript () {
	touch $1 && chmod +x $1 && nvim $1
}

fcd () {
    local dir=$(jq --raw-output --arg computer $computer '.global.directories[] , .[$computer].directories[]' $config_file | fzf)
    local dir=${(e)dir}
    [ -n "$dir" ] && cd $dir
}

fhist () {
	cat ${ZDOTDIR}/.zsh_history | fzf
}

viman () {
    vim -c "Man $1" -c 'silent only'
}

alias \
    g="git"\
    sl="ls" \
	tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf" \
	jlremote="jupyter lab --no-browser --port=9876" \
	today='date +"%F"'\
	vi="nvim" \
    #vim="nvim"
	vim="nvim"
