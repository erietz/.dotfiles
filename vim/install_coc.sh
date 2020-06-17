#!/usr/bin/env zsh

extensions=(
	coc-json
	coc-markdownlint
	coc-highlight
	coc-python
	coc-jedi
	coc-texlab
	coc-ultisnips
	coc-git
)

vim -c "CocInstall -sync $extensions | q"

