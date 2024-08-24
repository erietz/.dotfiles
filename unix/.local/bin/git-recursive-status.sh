#!/bin/sh

for file in $(find . -name ".git" -type d); do
	pushd $(dirname $file)
	git status
	popd
done
