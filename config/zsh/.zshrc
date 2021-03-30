#echo "sourced \t ~/.config/zsh/.zshrc"
#ZSH_DISABLE_COMPFIX=true

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

setopt COMPLETE_ALIASES

bindkey -v
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

# breaks neoterm
# [[ $(uname) == "Linux" ]] && bindkey -s '^p'  'fzf | xargs -r nvim^M' || bindkey -s '^p'  'fzf | xargs nvim^M'

# load all source files---------------------------------------------------------
#
load_configs() {
	local files=($@)
	for file in $files;
	do
		[ -f $file ] && source $file #&& echo "sourced \t $file" || echo "$file has not been sourced"
	done
}

local computer=$(hostname -s | sed 's/[0-9]//g')

source_files=(
	$ZDOTDIR/$computer.zsh
	$ZDOTDIR/aliases.zsh
	$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
	$ZDOTDIR/zsh-completions/zsh-completions.plugin.zsh
	$HOME/.git-prompt.sh
)

load_configs $source_files

setopt PROMPT_SUBST ; PS1='%{$fg[cyan]%}[%{$fg[red]%}%n%{$fg[white]%}@%{$fg[red]%}%m %{$fg[white]%}%c%{$fg[magenta]%}$(__git_ps1 " (%s)")%{$fg[cyan]%}]\$ %{$reset_color%}'

#prompt='%B%{$bg[black]%}%{$fg[red]%}[%{$fg[cyan]%}%m %{$fg[white]%}%3~%{$fg[red]%}] %{$fg[magenta]%}$(git_branch)%{$reset_color%}$%b '
# Starship prompt---------------------------------------------------------------
# eval "$(starship init zsh)"
