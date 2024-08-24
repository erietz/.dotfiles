#!/usr/bin/env bash

os=$(uname -s)

stow_it() {
	stow -v $1
}

case "$os" in
Linux) stow_it linux ;;
Darwin) stow_it darwin ;;
*) echo "unknown os" && exit 1 ;;
esac

stow_it unix
