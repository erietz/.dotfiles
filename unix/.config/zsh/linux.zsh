# X forwarding
#export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
#export LIBGL_ALWAYS_INDIRECT=1

alias ls="ls --color=auto"
alias open="xdg-open"
alias spotify="spotify --force-device-scale-factor=2 &> /dev/null & disown"
alias keybindings='grep "bindsym \$mod+" ${HOME}/.config/i3/config | fzf'

is_ubuntu=$(grep -i "ubuntu" /etc/lsb-release)

if [ ! -z $is_ubuntu ]; then
    alias bat="batcat"
    alias fd="fdfind"
fi
