# IU supercomputers
export SCRATCH="/N/dc2/scratch/ewrietz"
export SLATE="/N/slate/ewrietz"
export GAUSS_SCRDIR="/tmp/ewrietz/scratch"
export CARB="/N/dc2/projects/carbocation"

# Use my modules from anywhere
export PYTHONPATH="/N/slate/ewrietz/python/modules/:$PYTHONPATH"

export PATH="$PATH:/N/slate/ewrietz/applications/apps/"
export PATH="$PATH:/N/slate/ewrietz/applications/scripts/"


alias scratch="cd $SCRATCH"
alias gview='sh /N/soft/rhel6/gaussian/gv/gview.sh -soft'
alias myjobs='qstat -u ewrietz'

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

