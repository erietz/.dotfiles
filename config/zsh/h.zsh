alias \
	myjobs='qstat -u ewrietz'\
	ls="ls --color=auto"\
    realpath='readlink -e'

[ -f $HOME/.config/zsh/.zsh_hpc.sh ] && source $HOME/.config/zsh/.zsh_hpc.sh

source activate ethan
