b () {
	local string=""
	for i in {1..$1}
		string+=$(printf "../")
	cd $string
}

newscript () {
	touch $1 && chmod +x $1 && vim $1
}

fcd () {
    local dir=$(print -l $common_dirs | fzf)
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
	vi="vim" \
<<<<<<< HEAD
    #code="open -a Visual\ Studio\ Code"

=======
>>>>>>> 02d8a283fe70c6127e1fff955506d5fec8007015
