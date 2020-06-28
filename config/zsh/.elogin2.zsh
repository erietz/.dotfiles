export FPATH=/usr/share/zsh/functions/Completion:$FPATH
fpath=( /usr/share/zsh/functions/**/*(/) $fpath)

#export LS_OPTIONS='--color=auto'
#eval "$(dircolors -b)"
#alias ls='ls $LS_OPTIONS'
#
export LS_OPTIONS='--color=auto'

[ -f $HOME/.config/zsh/.zsh_hpc.sh ] && source $HOME/.config/zsh/.zsh_hpc.sh

source activate ethan


isjobrunning () {
	job=$(echo $1 | grep -o "[0-9]*" | tail -n 1)
	job=$(squeue -u ewrietz | grep $job)
	if [ -z "$job" ]; then
		echo "No"
	else
		echo "$job"
	fi
	}

arejobsqueued () {
	job=$(grep 'job-name' *.slurm | awk -F"=" '{print $2}')
	squeue -u ewrietz | grep $job
}
arejobsrunning () {
	for file in $(ls *.out)
	do
		isjobrunning $file
	done
}
anyjobs () {
	arejobsrunning
	arejobsqueued
}
steps () {
	grep -c -F "Summary information" $1
}


common_dirs=(
	$HOME/.config/zsh
	$HOME/.config/coc/extensions/node_modules
	/N/slate/ewrietz 
	/N/slate/ewrietz/IyengarLab 
	/N/dc2/projects/carbocation 
	/N/dc2/projects/carbocation/ethan
)

