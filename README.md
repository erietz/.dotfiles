# About

This is a new (bare) repository of my dotfiles. The advantage of using a bare git repo is to avoid having to
symlink files from a normal git repo into the home folder.

This repo was initially created using 

`git init --bare $HOME/.cfg`

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

`config config --local status.showUntrackedFiles no`

`echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc`

The home directory can now be treated like a normal git repository except using `config` instead of `git`.

## Note

It may be necessary to remove the bare repository from tracking by git using.

`echo "dotfiles" >> .gitignore`

# Usage

On a new computer, clone this repository into a new bare git repository.

`git clone --bare git@github.com:ethanrietz/dotfiles.git $HOME/dotfiles`

make an alias for the session

`alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`

and checkout the files into the home directory

`config checkout`
