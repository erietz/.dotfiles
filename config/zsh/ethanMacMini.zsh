#export PYTHONPATH="$HOME/git/ethan/modules/"
# fixes neovim breaks over ssh???
export LANG="en_US.UTF-8"

#export PATH="$PATH:/Applications/MATLAB_R2020a.app/bin/matlab"

# Created using /usr/local/anaconda3/bin/conda init zsh
#   - Then copy the content of ~/.zshrc to here
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NODE_PATH=$(npm root --quiet -g)

# Fixes crazy problem with python environment not loading when starting tmux
#[[ -z $TMUX ]] || conda deactivate; conda activate base
[[ -z $TMUX ]] || conda deactivate; conda activate base

ethanMacMini_files=(
    $ZDOTDIR/.iterm2_shell_integration.zsh
	~/.fzf.zsh
    )

load_configs $ethanMacMini_files

stty discard undef # control-o does nothing on macos by default (make it work)
