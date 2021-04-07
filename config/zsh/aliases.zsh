config_file="$HOME/.config/fuzzy/config.json"

viw () {
    nvim $(which $1)
}

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

zathura () {
    /usr/bin/zathura $1 &> /dev/null & disown
}

gpu () {
    pushd $1
    git pull
    popd
}

alias \
    grep="grep --color=auto" \
    g="git"\
    sl="ls" \
    tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf" \
    jlremote="jupyter lab --no-browser --port=9876" \
    today='date +"%F"'\
    vi="$EDITOR" \
    vim="$EDITOR" \
    e="emacs -nw" \
    l="ls -lah" \
    c="code --reuse-window" \
    ci="code-insiders --reuse-window" \
    rcp="rsync --progress --verbose --recursive"
