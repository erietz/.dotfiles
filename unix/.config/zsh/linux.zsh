# X forwarding
#export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
#export LIBGL_ALWAYS_INDIRECT=1

alias ls="ls --color=auto"
alias spotify="spotify --force-device-scale-factor=2 &> /dev/null"
alias keybindings='grep "bindsym \$mod+" ${HOME}/.config/i3/config | fzf'

pacman_bigpacs() {
	pacman -Qeti \
		| grep -E '(Name|Installed Size)' \
		| paste - - \
		| awk '{printf("%-25s %9s %5s\n", $3, $7, $8)}' \
		| sort -k3 -k2n
}

open () {
    # in zsh, the `&!` and `&|` operators disown the job immediately
    xdg-open "$@" 1>/dev/null 2>/dev/null &|
}

# NOTE: this works in bash but the builtin disown behaves differntly in zsh and
# kills suspended jobs in addition to the job_id...
# open () {
#     xdg-open "$@" 1>/dev/null 2>&1 &
#     job_id=$(jobs -l | grep "$!" | perl -pe 's/\[(\d*)\].*/\1/')
#     disown "%${job_id}"
# }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ethan/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ethan/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/ethan/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/ethan/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
