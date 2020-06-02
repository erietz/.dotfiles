# IU supercomputers
export SCRATCH="/N/dc2/scratch/ewrietz"
export SLATE="/N/slate/ewrietz"
#export GAUSS_SCRDIR="/tmp/ewrietz/scratch"
export GAUSS_SCRDIR="/N/dc2/scratch/ewrietz/"
export CARB="/N/dc2/projects/carbocation"

# Use my modules from anywhere
export PYTHONPATH="/N/slate/ewrietz/IyengarLab/ethan/modules:$PYTHONPATH"

PATH="$PATH:/N/slate/ewrietz/applications/apps"
export PATH="$PATH:/N/slate/ewrietz/hpc_codes/bin"


alias scratch="cd $SCRATCH"
alias gview='sh /N/soft/rhel6/gaussian/gv/gview.sh -soft'


