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

#-------------------------------------------------------------------------------
ZSH_HOME := $(HOME)/.config/zsh

zsh: $(HOME)/.git-prompt.sh $(ZSH_HOME)/zsh-autosuggestions $(ZSH_HOME)/zsh-syntax-highlighting $(ZSH_HOME)/zsh-completions ## Install zsh and change default interactive shell to zsh
	sudo apt install -y zsh
	#chsh -s $(shell which zsh)

$(HOME)/.git-prompt.sh:
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

$(ZSH_HOME)/zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $@

$(ZSH_HOME)/zsh-syntax-highlighting:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $@

$(ZSH_HOME)/zsh-completions:
	git clone https://github.com/zsh-users/zsh-completions.git $@
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
dirs:
	mkdir -p ~/.config ~/.local

links: dirs $(DOT_FILES) ## Create symlinks for all my dotfiles

# How to build a dotfile from a dotless file
$(HOME)/.%: %
	ln -s $(HOME)/.ewr/$^ $@
#-------------------------------------------------------------------------------

vim-plugins:
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa

programs:
	sudo apt install -y \
	fzf \
	fd-find \
	ripgrep \
	neovim \
	python3 \
	nodejs \
	npm \
	yarn 

everything: zsh programs vim-plugins links ## Take care of everything for fresh install

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\033[36m\1\\033[m:\2/' | column -c2 -t -s :)"
