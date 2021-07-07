# Load terminal colors
autoload -U colors && colors

# Safety
set -o noclobber
alias cp='cp -i'
alias mv='mv -i'

# tab completion----------------------------------------------------------------
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
setopt globdots
_comp_options+=(globdots)   # include hidden files
setopt COMPLETE_ALIASES

# keybindings-------------------------------------------------------------------
# vim
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

# load all source files---------------------------------------------------------
load_configs() {
    local files=($@)
    for file in $files;
    do
        [ -f $file ] && source $file #&& echo "sourced \t $file" || echo "$file has not been sourced"
    done
}

# - Computer specific zshrc files are named via hostname.
# - Sometimes hostname adds a number if logged in twice
local computer=$(hostname -s | sed 's/[0-9]//g')

source_files=(
    $ZDOTDIR/$computer.zsh
    $ZDOTDIR/unix.zsh
    $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
    $ZDOTDIR/zsh-completions/zsh-completions.plugin.zsh
    $HOME/.git-prompt.sh
)

case $OSTYPE in
    darwin*)
        source_files+=($ZDOTDIR/mac.zsh)
        ;;
    linux*)
        source_files+=($ZDOTDIR/linux.zsh)
        ;;
esac

load_configs $source_files

# Prompt------------------------------------------------------------------------
setopt PROMPT_SUBST ; PS1='%{$fg[cyan]%}[%{$fg[red]%}%n%{$fg[white]%}@%{$fg[red]%}%m %{$fg[blue]%}%c%{$fg[magenta]%}$(__git_ps1 " (%s)")%{$fg[cyan]%}]\$ %{$reset_color%}'
