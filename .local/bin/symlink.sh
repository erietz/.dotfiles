#!/bin/bash

# TODO ------------------------------------------------------------
# Create symlinks for config files that do not belong in home directory
# Ex: (~/.ipython/profile_default/ipython_config.py)
# ----------------------------------------------------------------------

# If file or directory already exists in home directory then we don't want to
# overwrite it.

directory=$HOME/.dotfiles
place=$HOME/
files="profile
	bashrc 
	bash_profile 
	vim 
	latexmkrc
	scripts
	inputrc
	tmux.conf"

#-------------------------------------------------------------------------------
# Create a link for each file or directory in $files if it doesn't already exist
for file in $files; do
	if test -f ${place}/.$file; then
		problemFiles+="$file "
	       	#echo "A $file already exists, or is a symbolic link that points to a legit file" 
	elif test -d ${place}/.$file; then
		problemDirectories+="$file "
		#echo "A directory already exists named $file or is a link that points to a legit directory" 
	elif test -L ${place}/.$file; then 
		echo "A link named $file exists and points to file or directory that does not exist" 
	else ln -s ${directory}/$file ${place}/.$file &&
		echo "Created a link for $file" 
	fi
done
#-------------------------------------------------------------------------------

if [[ $problemFiles = " " ]] && [[ $problemDirectories = " " ]]; then
	exit 0
fi

echo -e "\n\n\n\n"
echo -e "Files ( $problemFiles) and directories ( $problemDirectories) already \
exist and will be overwritten. \n\n\
Answering yes to the following qustion will continue the script and overwrite \
the existing files...\n"

read -p "Would you like to continue the script and overwrite these files? [Y/n]" continue

if [[ $continue != y ]] && [[ $continue != Y ]]; then
	exit 0
else
	for file in $files; do
		ln -s -f -n ${directory}/$file ${place}/.$file
	done
fi
