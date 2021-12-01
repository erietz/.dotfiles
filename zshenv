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

export EWR_PLUGIN_DIR="${HOME}/.config/ewr-plugins"

export SAVEHIST=1000000
export HISTSIZE=1000000

# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

PATH_SAVE="$PATH"
PATH="$HOME/.local/bin"
PATH+=":$HOME/.local/ebin"
PATH+=":$GEM_HOME/bin"
PATH+=":$HOME/.cargo/bin"
PATH+=":$PATH_SAVE"
export PATH

# Remote system may not have neovim
hash nvim 2>/dev/null && export EDITOR="nvim" || export EDITOR="vim"
hash nvim 2>/dev/null && export VISUAL="nvim" || export VISUAL="vim"

export BROWSER="firefox"
# export TERMINAL="/usr/bin/alacritty"
#export GPG_TTY=$(tty) # fix pass not prompting for password
#export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
#export GEM_HOME="$HOME/.gem"
export GEM_PATH="$GEM_PATH:$GEM_HOME/bin"
export RANGER_LOAD_DEFAULT_RC="FALSE"

#-------------------------------------------------------------------------------
# Avoid polluting $HOME with dotfiles
#-------------------------------------------------------------------------------
# See https://wiki.archlinux.org/index.php/XDG_Base_Directory

# Set XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="${ZDOTDIR}/.zsh_history"

# X11
# export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0"

# Misc
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export LESSHISTFILE="-"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

#-------------------------------------------------------------------------------

# Manpages
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[100;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[34m'

if [[ "$OSTYPE" =~ ^linux ]]; then
    export QT_QPA_PLATFORMTHEME="qt5ct"
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
elif [[ "$OSTYPE" =~ ^darwin ]]; then
    export CLICOLOR=1
fi
