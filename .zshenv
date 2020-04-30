export ZDOTDIR="$HOME/.config/zsh"
export CLICOLOR=1
export VISUAL="vim"
export EDITOR="vim"
export BROWSER="Brave Browser"
export GPG_TTY=$(tty) # fix pass not prompting for password

# Clean up ~/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export LESSHISTFILE="-"
