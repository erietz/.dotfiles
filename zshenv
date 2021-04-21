#-------------------------------------------------------------------------------
# Author: Ethan Rietz
# Date: 2021-04-13
# Description: 
#   Settings for login shells
#   Other zsh config files are in ZDOTDIR for interactive shells
#-------------------------------------------------------------------------------

# - I have found that some of these settings do not get loaded on linux systems
# due to another file (/etc/zprofile ?) being sourced after this file.
#
#echo "sourced \t ~/.zshenv"


export GITHUB="https://github.com/erietz"

export PATH="$HOME/.local/bin:$HOME/.local/ebin:$HOME/.gem/bin:$PATH"
export CLICOLOR=1 # TODO is this mac specific?
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="/usr/bin/alacritty"
#export GPG_TTY=$(tty) # fix pass not prompting for password
#export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$GEM_PATH:$GEM_HOME/bin"
export RANGER_LOAD_DEFAULT_RC="FALSE"

# Clean up ~/
# https://wiki.archlinux.org/index.php/XDG_Base_Directory

# TODO figure out best practice for XDG_RUNTIME_DIR
#unset XDG_RUNTIME_DIR
#export XDG_RUNTIME_DIR=""
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export LESSHISTFILE="-"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export HISTFILE="${ZDOTDIR}/.zsh_history"
export SAVEHIST=1000000
export HISTSIZE=1000000

# Manpages
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[100;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[34m'

[[ "$OSTYPE" != "darwin"* ]] && source $ZDOTDIR/zshenv-old-trusty.zsh #&& echo "sourced \t ~/.config/zsh/zshenv_manjaro.zsh"
