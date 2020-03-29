# File contains configurations for bash and is sourced in ~/.bash_profile

if [[ "$OSTYPE" == "darwin"* ]]; then
	if [ -f ~/.bash_local/bash_mac ]; then
		source ~/.bash_local/bash_mac
	fi
else
	if [ -f ~/.bash_local/bash_hpc ]; then
		source ~/.bash_local/bash_hpc
	fi
fi

if [ -f ~/.profile ]; then
	source ~/.profile
fi

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# vim keys for bash
set -o vi

# Environmental Variables-------------------------------------------------------

export VISUAL="vim"
export EDITOR="vim"
export BROWSER="Brave Browser"

# color of ls output
export CLICOLOR=1

# Put things in PATH------------------------------------------------------------

# call my scripts from any directory
export PATH=$PATH:~/.dotfiles/scripts:~/.local/bin/:~/bin

# Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Aliases
alias gpom="git push origin master"
alias gca="git commit -a -m"

# Create a new dated note
note() { vim "$(date +%F)_${*}.md" ; }

# ls after cd
c() { cd "$1" && ls ; }

alias jlremote="jupyter lab --no-browser --port=9876"
