# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ethan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ethan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ethan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ethan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
