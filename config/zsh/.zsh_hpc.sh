# IU supercomputers
export SCRATCH="/N/dc2/scratch/ewrietz"
export SLATE="/N/slate/ewrietz"
#export GAUSS_SCRDIR="/tmp/ewrietz/scratch"
export GAUSS_SCRDIR="/N/dc2/scratch/ewrietz/gaussScratch"
#[ -d $GAUSS_SCRDIR ] || mkdir $GAUSS_SCRDIR
export CARB="/N/dc2/projects/carbocation"

# Use my modules from anywhere
export PYTHONPATH="/N/slate/ewrietz/IyengarLab/ethan/modules:$PYTHONPATH"

PATH="$PATH:/N/slate/ewrietz/IyengarLab/ethan/bin"
PATH="$PATH:/N/slate/ewrietz/applications/apps"
PATH="$PATH:/N/slate/ewrietz/IyengarLab/ethan/velspack-ethan"
export PATH


alias scratch="cd $SCRATCH"
alias gview='sh /N/soft/rhel6/gaussian/gv/gview.sh -soft'


common_dirs=(
    $HOME/.config/.ewr
	$HOME/.config/zsh
	$HOME/.config/coc/extensions/node_modules
	/N/slate/ewrietz 
	/N/slate/ewrietz/IyengarLab 
	/N/dc2/projects/carbocation 
	/N/dc2/projects/carbocation/ethan
)

