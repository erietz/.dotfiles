#!/bin/zsh
#

files=($HOME/.ewr/**/*(D))


for file in $files;
do
	echo "ln -s $file $HOME/"
done

