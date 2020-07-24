alias \
	myjobs='qstat -u ewrietz'\
	ls="ls --color=auto"

[ -f $HOME/.config/zsh/.zsh_hpc.sh ] && source $HOME/.config/zsh/.zsh_hpc.sh

source activate ethan
