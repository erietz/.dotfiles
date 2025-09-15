
# Editor (check for nvim)
if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else
    set -gx EDITOR vim
    set -gx VISUAL vim
end

# Avoid polluting $HOME with dotfiles (XDG Base Directories)
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Misc
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse'
set -gx BAT_THEME ansi
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

# X11 / GTK
# set -gx XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# Misc paths
set -gx INPUTRC "$XDG_CONFIG_HOME/inputrc"
set -gx TMUX_TMPDIR "$XDG_RUNTIME_DIR"
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"

# Less
set -gx LESSHISTFILE "/dev/null"
set -gx LESS "IFRSX"
set -gx LESS_TERMCAP_md (printf "\e[32m")
set -gx LESS_TERMCAP_me (printf "\e[0m")
set -gx LESS_TERMCAP_se (printf "\e[0m")
set -gx LESS_TERMCAP_so (printf "\e[100;37m")
set -gx LESS_TERMCAP_ue (printf "\e[0m")
set -gx LESS_TERMCAP_us (printf "\e[34m")

# OS specific
if test (uname) = "Linux"
    set -gx QT_QPA_PLATFORMTHEME qt5ct
    set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
else if test (uname) = "Darwin"
    set -gx CLICOLOR 1
end

# Cargo environment
if test -f "$HOME/.cargo/env.fish"
	source "$HOME/.cargo/env.fish"
end

