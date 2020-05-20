#!/bin/bash

if [ -z "$1" ]
then 
	echo "Supply a computer to start server on"
	exit 1
fi

spaces () {
	printf "\n\n\n\n"
}

jllocal () {
  port=9876
  #remote_username=USERNAME
  remote_hostname=$1
  url="http://localhost:$port"
  spaces
  echo "Open $url in a browser"
  #cmd="ssh -CNL localhost:"$port":localhost:"$port" $remote_username@$remote_hostname"
  cmd="ssh -L localhost:"$port":localhost:"$port" $remote_hostname"
  echo "Running '$cmd'"
  spaces
  eval "$cmd"
}

jllocal $1
#alias jlremote="jupyter lab --no-browser --port=9876"
