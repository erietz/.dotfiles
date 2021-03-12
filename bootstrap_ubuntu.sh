#!/bin/bash

# curl this script and run as sudo
# curl https://raw.githubusercontent.com/erietz/.ewr/master/bootstrap_ubuntu.sh bootstrap_ubuntu.sh
# sudo ./bootstrap_ubuntu.sh

read -p 'Abort this setup script? [Y/n]' -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo ''
  echo 'Setup aborted.'
  exit
fi

sudo add-apt-repository  ppa:klaus-vormweg/awesome -y
sudo apt install -y \
	awesome \
	git \
	zsh \
	neovim \
	fzf \
    fd-find \
	python3 \
    nodejs \
    npm \
    yarn \


git clone https://github.com/erietz/.ewr.git ~/.ewr
pushd ~/.ewr
./install
popd

nvim +'PlugInstall --sync' +qa
sudo chsh -s /bin/zsh
sudo apt update && sudo apt upgrade
