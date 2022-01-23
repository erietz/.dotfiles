old_trusty_files=(
    /usr/share/fzf/key-bindings.zsh
    /usr/share/fzf/completion.zsh
    )

load_configs $old_trusty_files

open () {
    xdg-open $1 &> /dev/null & disown
}
