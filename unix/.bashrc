# Simply have .bash_profile unconditionally source .bashrc, but .bashrc itself
# immediately returns for non-interactive shells
case $- in
    *i*) ;;
      *) return ;;
esac

# Handled by `set editing-mode vi` in ~/.inputrc, which is loaded by bash
# automatically.
#
# set -o vi

[ -f ~/.fzf.bash ] && . ~/.fzf.bash
[ -f ~/src/fzf-git.sh/fzf-git.sh ] && . ~/src/fzf-git.sh/fzf-git.sh

if [[ -x /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

# Load bash-completion. This eagerly sources everything in
# /opt/homebrew/etc/bash_completion.d/, which is where `brew install git` drops
# git-completion.bash -> so _git (subcommand + ALIAS completion) is defined here.
# IMPORTANT: this must run BEFORE the fzf block below (see the note there).
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

if command -v starship >/dev/null 2>&1; then
	eval "$(starship init bash)"
fi

if command -v mise >/dev/null 2>&1; then
	eval "$(mise activate bash)"
fi

# fzf registers its own completion for a default list of commands that includes
# `git` (path/fuzzy completion on the ** trigger). On eval, fzf snapshots each
# command's EXISTING compspec into _fzf_orig_completion_<cmd> and falls back to it
# for a plain <TAB>. So because bash-completion above already loaded git's _git,
# fzf captures it: `git <TAB>` -> normal git completion (subcommands + aliases),
# `git **<TAB>` -> fzf fuzzy path picker. Reverse this order and fzf has nothing
# to fall back to, so `git <TAB>` degrades to generic path completion (no aliases).
if command -v fzf >/dev/null 2>&1; then
	eval "$(fzf --bash)"
fi

alias tm="tmux attach || tmux"
alias ls="ls --color=auto"

# GNU-style file colors used by fd, ls, eza, etc. These are standard ANSI color
# names (not fixed RGB), so the terminal maps them to its active theme -> they
# adapt to both light and dark backgrounds. Any file type not listed renders in
# the normal text color, which keeps things clean on a light background.
#   di=34      directories                 blue   (use 1;34 if too dim on a pure-black theme)
#   ln=35      symlinks                    magenta (more legible than cyan on light bg)
#   so=35      sockets                     magenta
#   pi=33      named pipes                 yellow
#   ex=32      executables                 green
#   bd=33      block devices               yellow
#   cd=33      char devices                yellow
#   su=31      setuid                      red
#   sg=31      setgid                      red
#   tw=34      sticky+other-writable dir   blue
#   ow=34      other-writable dir          blue
#   or=31      broken symlink              red
#   mi=02;35   missing target              dim magenta
export LS_COLORS='di=34:ln=35:so=35:pi=33:ex=32:bd=33:cd=33:su=31:sg=31:tw=34:ow=34:or=31:mi=02;35'

# bash configuration options, no need to export these
HISTSIZE=100000            # commands to keep in memory for the current session
HISTFILESIZE=200000        # commands to keep in the on-disk history file
HISTCONTROL=ignoreboth     # skip duplicate and space-prefixed commands in history

shopt -s histappend        # append to the history file on exit instead of overwriting
shopt -s checkwinsize      # keep $LINES/$COLUMNS accurate after a terminal resize
shopt -s globstar          # let ** match files/dirs recursively in globs
# shopt -s cdspell           # auto-correct minor typos in `cd` arguments
