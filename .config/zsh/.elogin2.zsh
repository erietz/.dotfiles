# IU supercomputers
export SCRATCH="/N/dc2/scratch/ewrietz"
export SLATE="/N/slate/ewrietz"
export GAUSS_SCRDIR="${SCRATCH}/gaussScratch"

export FPATH=/usr/share/zsh/functions/Completion:$FPATH
fpath=( /usr/share/zsh/functions/**/*(/) )

eval $(~/.linuxbrew/bin/brew shellenv)
