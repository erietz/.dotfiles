# About {{{
#-------------------------------------------------------------------------------
# Author: Ethan Rietz
# Date: 2021-04-13
# Description:
#
#   - Settings for login shells
#   - Other zsh config files are in ZDOTDIR for interactive shells
#   - The order of sourcing operations is as follows
#
#              +----------------+-----------+-----------+------+
#              |                |Interactive|Interactive|Script|
#              |                |login      |non-login  |      |
#              +----------------+-----------+-----------+------+
#              |/etc/zshenv     |    A      |    A      |  A   |
#              +----------------+-----------+-----------+------+
#              |~/.zshenv       |    B      |    B      |  B   |
#              +----------------+-----------+-----------+------+
#              |/etc/zprofile   |    C      |           |      |
#              +----------------+-----------+-----------+------+
#              |~/.zprofile     |    D      |           |      |
#              +----------------+-----------+-----------+------+
#              |/etc/zshrc      |    E      |    C      |      |
#              +----------------+-----------+-----------+------+
#              |~/.zshrc        |    F      |    D      |      |
#              +----------------+-----------+-----------+------+
#              |/etc/zlogin     |    G      |           |      |
#              +----------------+-----------+-----------+------+
#              |~/.zlogin       |    H      |           |      |
#              +----------------+-----------+-----------+------+
#              |~/.zlogout      |    I      |           |      |
#              +----------------+-----------+-----------+------+
#              |/etc/zlogout    |    J      |           |      |
#              +----------------+-----------+-----------+------+
#
#-------------------------------------------------------------------------------
# }}}
# PATH {{{

path_prefix="$HOME/.local/bin"
path_prefix+=":$HOME/go/bin"
path_prefix+=":$GEM_HOME/bin"
path_prefix+=":$HOME/.cargo/bin"
path_prefix+=":$HOME/.gem/ruby/3.0.0/bin"
export PATH="$path_prefix:$PATH"

# }}}
# Misc {{{

export EWR_PLUGIN_DIR="${HOME}/.config/ewr-plugins"
export SAVEHIST=1000000
export HISTSIZE=1000000

# Remote system may not have neovim
command -v nvim >/dev/null && export EDITOR="nvim" || export EDITOR="vim"
command -v nvim >/dev/null && export VISUAL="nvim" || export VISUAL="vim"

export BROWSER="firefox"
export TERMINAL="/bin/alacritty"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BAT_THEME="ansi"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# }}}
# Avoid polluting $HOME with dotfiles {{{

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
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# }}}
# Less (as there is no ~/.lessrc) {{{

# no history file
export LESSHISTFILE="/dev/null"

# -I: ignore case when searching
# -F: quit immediately when the entire file fits in one screen (in effect, mimic cat’s behavior)
# -R: enable colored output (for example, when piping to less from diff --color=always)
# -S: truncate long lines instead of wrapping them to the next line
# -X: don’t clear screen on exit
export LESS="IFRSX"

# Manpages
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[100;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[34m'

# }}}
# OS Specific {{{

if [[ "$OSTYPE" =~ ^linux ]]; then
    export QT_QPA_PLATFORMTHEME="qt5ct"
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
elif [[ "$OSTYPE" =~ ^darwin ]]; then
    export CLICOLOR=1
fi

# }}}
# per computer settings not tracked by git {{{

[ -f ~/.zprofile-extra ] && source ~/.zprofile-extra

# }}}
. "$HOME/.cargo/env"
