#ZSH_DISABLE_COMPFIX=true

local computer=$(hostname -s | sed 's/[0-9]//g')

[ -f $ZDOTDIR/$computer.zsh ] && source $ZDOTDIR/$computer.zsh
[ -f $ZDOTDIR/aliases.zsh ] && source $ZDOTDIR/aliases.zsh

autoload -U colors && colors

set -o noclobber
alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -i'

# Prompt------------------------------------------------------------------------
git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /'
}

## PS1 variable has weird problems with single quotes
setopt prompt_subst
prompt='%B%{$fg[blue]%}[%{$fg[green]%}%m %{$fg[magenta]%}%3~%{$fg[blue]%}] %{$fg[cyan]%}$(git_branch)%{$reset_color%}$%b '

## Updates editor information when the keymap changes.
#function zle-keymap-select() {
#  zle reset-prompt
#  zle -R
#}
#
#zle -N zle-keymap-select
#
#function vi_mode_prompt_info() {
#  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
#}
#
## define right prompt, regardless of whether the theme defined it
#RPS1='$(vi_mode_prompt_info)'
#RPS2=$RPS1

#autoload -Uz promptinit && promptinit
#prompt suse
#-------------------------------------------------------------------------------

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
