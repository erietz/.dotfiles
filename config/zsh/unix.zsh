config_file="$HOME/.config/fuzzy/config.json"

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# b - back (For really deep directories)
# usage: b <int>
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

okular () {
    /usr/bin/okular $1 &> /dev/null & disown
}

gpu () {
    pushd $1
    git pull
    popd
}

gst () {
  for file in $(find . -name ".git" -type d); do
    pushd $(dirname $file)
    git status
    popd
  done
}

alias c="code --reuse-window"
alias ci="code-insiders --reuse-window"
alias e="emacs -nw"
alias f="find . -type f -iname"
alias g="git"
alias grep="grep --color=auto"
alias jlremote="jupyter lab --no-browser --port=9876"
alias l="lsd -l"
alias rcp="rsync --progress --verbose --recursive"
alias sl="ls"
alias ta="tmux attach"
alias tm="tmux attach || tmux"
alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf"
alias today='date +"%F"'
alias vim="nvim"
