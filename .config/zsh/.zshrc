#ZSH_DISABLE_COMPFIX=true

autoload -U colors && colors

git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /'
}

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[cyan]%} $(git_branch)%{$reset_color%}$%b "

#autoload -Uz promptinit && promptinit
#prompt suse

autoload -U compinit
zstyle ':completion:*' menu select
	zmodload zsh/complist
	compinit
	_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char


alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias jlremote="jupyter lab --no-browser --port=9876"
eval $(~/.linuxbrew/bin/brew shellenv)

#source $HOME/.bash_local/bash_hpc
[ -f $ZDOTDIR/.$(hostname).zsh ] && source $ZDOTDIR/.$(hostname).zsh
[ -f $ZDOTDIR/.aliases.zsh ] && source $ZDOTDIR/.aliases.zsh
source $ZDOTDIR/.zsh_hpc.sh
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
