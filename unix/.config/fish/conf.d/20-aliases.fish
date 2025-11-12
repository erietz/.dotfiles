# ~/.config/fish/conf.d/aliases.fish

# Regular aliases
alias f='find . -type f -iname'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias tm='tmux attach || tmux'
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias ca='conda activate'
alias cda='conda deactivate'
alias cad='conda activate dev'

abbr -a :silent '1>/dev/null 2>/dev/null'
abbr -a :daemon '1>/dev/null 2>/dev/null &'

# Git shortcuts
abbr -a gco 'git checkout'
abbr -a gst 'git status'
abbr -a gcm 'git commit -m'
abbr -a gba 'git branch -a'
abbr -a gl 'git log --oneline --graph --decorate'

# Conda shortcuts
abbr -a ca 'conda activate'
abbr -a cda 'conda deactivate'
abbr -a cad 'conda activate dev'

# Misc shortcuts
abbr -a today 'date +"%F"'
abbr -a jlremote 'jupyter lab --no-browser --port=9876'
abbr -a rcp 'rsync --progress --verbose --recursive'
abbr -a sl 'ls'
abbr -a l 'eza -l'
abbr -a vim 'nvim'
