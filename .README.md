# About

This is a new (bare) repository of my dotfiles. The advantage of using a bare git repo is to avoid having to
symlink files from a normal git repo into the home folder.

This repo was initially created using 

`git init --bare $HOME/dotfiles`

`alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`

`config config --local status.showUntrackedFiles no`

`echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $ZDOTDIR/.zshrc`

The home directory can now be treated like a normal git repository except using `config` instead of `git`.

# Usage

On a new computer, clone this repository into a new bare git repository.

`git clone --bare git@github.com:ethanrietz/dotfiles.git $HOME/dotfiles`

make an alias for the session

`alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`

and checkout the files into the home directory

`config checkout`

Then make sure to add the config alias to a permanent startup file and use in place.
of git.

## Note

- It may be necessary to remove the bare repository from tracking by git using. \
`echo "dotfiles" >> .gitignore`
- Vim plugins are already git repositories and must be managed by submodules. 
	- To add a new git repo as a submodule issue: `config submodule add <repo> <new name>`
	- Then on remote computer issue: `config submodule init && config submodule update`
