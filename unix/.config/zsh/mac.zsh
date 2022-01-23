
mac_files=(
    $ZDOTDIR/.iterm2_shell_integration.zsh
    ${HOME}/.fzf.zsh
)

load_configs $mac_files

alias \
    gview="/Applications/gv/gview.sh"\
    avogadro="open -a Avogadro"\
    scratch="cd $SCRATCH"
