# profile zsh startup time
# zmodload zsh/zprof

# basic settings {{{

# load terminal colors
autoload -U colors && colors

# safety
set -o noclobber
alias cp='cp -i'
alias mv='mv -i'

# tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
setopt globdots
_comp_options+=(globdots)   # include hidden files
setopt COMPLETE_ALIASES

# share history between tmux panes (i think)
setopt inc_append_history

# }}}
# keybindings {{{

bindkey -v  # vim
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Expand aliases
bindkey '^k' _expand_alias

# }}}
# source other files {{{

export EWR_PLUGIN_DIR="${HOME}/.config/ewr-plugins"

source_files=(
	$ZDOTDIR/$computer.zsh
	$ZDOTDIR/unix.zsh
	$EWR_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	$EWR_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
	$EWR_PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh
	# $EWR_PLUGIN_DIR/git-prompt.sh
)

case $OSTYPE in
	darwin*) source_files+=($ZDOTDIR/mac.zsh) ;;
	linux*) source_files+=($ZDOTDIR/linux.zsh) ;;
esac

for file in $source_files;
do
	[ -f $file ] && source $file
done

# }}}
# prompt {{{

# local prompt=''
# # prompt+='%{$fg[cyan]%}['
# prompt+='%{$fg[green]%}%n'       # $USERNAME
# prompt+='%{$fg[white]%}@'        # @
# prompt+='%{$fg[yellow]%}%m '      # hostname (up to first .)
# prompt+='%{$fg[blue]%}%~'        # working directory ($HOME replaced by ~)
# prompt+='%{$fg[white]%}$(__git_ps1 " (%s)")'  # git branch
# # prompt+='%{$fg[cyan]%}]'
# # prompt+=$'\n'
# # prompt+='%{$fg[red]%} ⚛'
# # prompt+='%{$fg[yellow]%} ☯'
# prompt+='%{$fg[white]%}> '
# prompt+='%{$reset_color%}'
# setopt PROMPT_SUBST ; PS1="${prompt}"


eval "$(starship init zsh)"

# }}}

# per machine settings that do not get tracked by git
[ -f ~/.zshrc-extra ] && source ~/.zshrc-extra

# zprof

function git-chob() {
	if [ "$1" = "-r" ]; then
		git branch -r | fzf | awk -F 'origin/' '{print $2}' | xargs -I {} git checkout -b "{}" "origin/{}"
	else
		git branch | fzf | awk '{print $NF}' | xargs git checkout
	fi
}

function _git-chob() {
	git-chob
	zle reset-prompt
}

zle -N _git-chob _git-chob
bindkey '^g' _git-chob

function _git-chob-remote() {
	git-chob -r
	zle reset-prompt
}

zle -N _git-chob-remote _git-chob-remote
bindkey '^b' _git-chob-remote
