#ZSH_DISABLE_COMPFIX=true

local computer=$(hostname -s | sed 's/[0-9]//g')

[ -f $ZDOTDIR/$computer.zsh ] && source $ZDOTDIR/$computer.zsh
[ -f $ZDOTDIR/aliases.zsh ] && source $ZDOTDIR/aliases.zsh

autoload -U colors && colors

set -o noclobber
alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -i'

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
bindkey -s '^p'  'fzf | xargs nvim^M'

export NODE_PATH=$(npm root --quiet -g)

# Fixes crazy problem with python environment not loading when starting tmux
[[ -z $TMUX ]] || conda deactivate; conda activate base

eval "$(starship init zsh)"
