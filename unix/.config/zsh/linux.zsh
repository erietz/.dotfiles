# X forwarding
#export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
#export LIBGL_ALWAYS_INDIRECT=1

alias ls="ls --color=auto"
alias spotify="spotify --force-device-scale-factor=2 &> /dev/null"
alias keybindings='grep "bindsym \$mod+" ${HOME}/.config/i3/config | fzf'

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


is_ubuntu=$(grep -i "ubuntu" /etc/lsb-release)

if [ ! -z $is_ubuntu ]; then
    alias bat="batcat"
    alias fd="fdfind"
fi
