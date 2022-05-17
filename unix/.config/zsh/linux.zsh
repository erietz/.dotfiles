# X forwarding
#export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
#export LIBGL_ALWAYS_INDIRECT=1

alias ls="ls --color=auto"
alias spotify="spotify --force-device-scale-factor=2 &> /dev/null"
alias keybindings='grep "bindsym \$mod+" ${HOME}/.config/i3/config | fzf'

open () {
    nohup xdg-open $1 1>/dev/null 2>/dev/null &
}

is_ubuntu=$(grep -i "ubuntu" /etc/lsb-release)

if [ ! -z $is_ubuntu ]; then
    alias bat="batcat"
    alias fd="fdfind"
fi
