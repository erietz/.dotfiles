#ZSH_DISABLE_COMPFIX=true

[ -f $ZDOTDIR/.$(hostname -s).zsh ] && source $ZDOTDIR/.$(hostname -s).zsh
[ -f $ZDOTDIR/.aliases.zsh ] && source $ZDOTDIR/.aliases.zsh

export PATH="$PATH:$HOME/.local/bin"

autoload -U colors && colors

set -o noclobber
alias cp='cp -i'
alias mv='mv -i'

git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /'
}

#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[cyan]%} $(git_branch)%{$reset_color%}$%b "
PS1="%B%{$fg[yellow]%}[%{$fg[cyan]%}%m %{$fg[magenta]%}%3~%{$fg[yellow]%}]%{$reset_color%}$%b "

#autoload -Uz promptinit && promptinit
#prompt suse

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
setopt globdots
_comp_options+=(globdots) 	# include hidden files

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char
bindkey -M menuselect '^[[Z' reverse-menu-complete

source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/zsh-completions/zsh-completions.plugin.zsh

test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
