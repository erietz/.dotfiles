# X forwarding
export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
export LIBGL_ALWAYS_INDIRECT=1

alias \
    ls="ls --color=auto" \
    spotify="spotify --force-device-scale-factor=2 &> /dev/null & disown" \
    keybindings='grep "bindsym \$mod+" ${HOME}/.config/i3/config | fzf' \
