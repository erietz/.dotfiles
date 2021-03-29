# TODO: Create conditional for OS dependent installer command
# TODO: Remove initial dots from DOTLESS_FILES?
# TODO: Remove dotbot submodule
# TODO: Get rid of starship since it requires specific fonts

DOTLESS_FILES := $(wildcard config/*)
DOTLESS_FILES += zshenv
DOTLESS_FILES += local/ebin

DOT_FILES := $(addprefix $(HOME)/.,$(DOTLESS_FILES))
#DOTLESS_FILES := $(addprefix $(HOME)/.ewr/,$(DOTLESS_FILES))

.DEFAULT_GOAL := help

# How to build a dotfile from a dotless file
$(HOME)/.%: %
	ln -s $(HOME)/.ewr/$^ $@

zsh: ## Install zsh and change default interactive shell to zsh
	sudo apt install -y zsh
	chsh -s $(shell which zsh)

dirs: ## Create Directories in case so things can get linked there
	mkdir -p ~/.config ~/.local

links: dirs $(DOT_FILES) ## Create symlinks for all my dotfiles

vim-plugins:
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa

programs:
	sudo apt install -y \
	fd-find \
	ripgrep \
	neovim \
	python3 \
	nodejs \
	npm \
	yarn 

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\033[36m\1\\033[m:\2/' | column -c2 -t -s :)"
