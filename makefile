# Author: Ethan Rietz
# Date: 05/19/2021
# Description: Deploy my dotfiles

# Variables {{{

.DEFAULT_GOAL := help

# These dirs need to exist before symlinks are created
DIRS := $(HOME)/.config $(HOME)/.local

# Manual control of which files are symlinked
# NOTE: Another approach is to use $(shell find .) then filter out .gitignore etc.
DOTLESS_FILES := $(wildcard config/*)
DOTLESS_FILES += zshenv local/ebin Xmodmap vim/
DOT_FILES := $(addprefix $(HOME)/.,$(DOTLESS_FILES))

ZDOTDIR := $(HOME)/.config/zsh
ZSHPLUGINS := zsh-autosuggestions zsh-syntax-highlighting zsh-completions
ZSHPLUGIN_PATHS := $(addprefix $(ZDOTDIR)/,$(ZSHPLUGINS))

# Find package manager (NOTE: some versions of "which" print text even when not
# found). The approach here is to set the variables below to arbitrary text if
# the executable is not found. Then later conditionally check to see if the
# variable contains an empty string.
PACMAN := $(shell which pacman >/dev/null 2>&1 || (echo "Your command failed with $$?"))
APT := $(shell which apt-get >/dev/null 2>&1 || (echo "Your command failed with $$?"))
APK := $(shell which apk >/dev/null 2>&1 || (echo "Your command failed with $$?"))
BREW := $(shell which brew >/dev/null 2>&1 || (echo "Your command failed with $$?"))
CHOCO := $(shell which choco >/dev/null 2>&1 || (echo "Your command failed with $$?"))

ifeq (, $(PACMAN))
	# On a rolling release distro, `-Syu` should always be used to upgrade the
	# system before installing any packages to prevent bricking your system.
	INSTALL := sudo pacman -Syu
	ODDBALL_PACKAGES := fd python-pip bat alacritty ttf-ubuntu-font-family
else ifeq (, $(APT))
	INSTALL := sudo apt-get install -y
	ODDBALL_PACKAGES := fd-find python3-pip bat
else ifeq (, $(APK))
	INSTALL := apk add
	ODDBALL_PACKAGES :=
else ifeq (, $(BREW))
	INSTALL := brew install
	ODDBALL_PACKAGES := fd pip3 koekeishiya/formulae/yabai koekeishiya/formulae/skhd bat
else ifeq (, $(CHOCO))
	INSTALL := choco install
else
	$(warning no installer found)
endif

# All of these packages are currently required by neovim config
PACKAGES := neovim vim fzf python3 nodejs npm jq

# }}}
# Help {{{

.PHONY: help
help: ## Print this help message
	@echo "----------------------------------------------------------------------"
	@echo "Usage of this makefile"
	@echo "----------------------------------------------------------------------"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sort | sed -e 's/$$//' | sed -e 's/:.*##/:,/' | column -t -s ,
	@echo
	@echo "For a dry run use this command: make -n <target>"
	@echo "----------------------------------------------------------------------"

# }}}
# {{{ ZSH

.PHONY: zsh
zsh: $(HOME)/.git-prompt.sh zsh-plugins ## Install zsh and change default interactive shell to zsh 
	$(INSTALL) zsh
	chsh -s /usr/bin/zsh

$(HOME)/.git-prompt.sh:
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o $@

.PHONY: zsh-plugins
zsh-plugins: $(ZSHPLUGIN_PATHS) ## Clones all of the zsh plugins

$(ZDOTDIR)/zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $@

$(ZDOTDIR)/zsh-syntax-highlighting:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $@

$(ZDOTDIR)/zsh-completions:
	git clone https://github.com/zsh-users/zsh-completions.git $@

.PHONY: clean-zsh
clean-zsh: ## Removes all zsh plugins
	rm -rf $(ZSHPLUGIN_PATHS)

# }}}
# Symbolic links {{{

$(DIRS):
	mkdir -p $@

.PHONY: links
links: $(DIRS) $(DOT_FILES) ## Symlink all dotfiles if they don't exists

# How to build a dotfile from a dotless file
$(HOME)/.%: %
	ln -s $(HOME)/.ewr/$^ $@

.PHONY: clean-links
clean-links: ## Remove all symbolic links
	echo $(DOT_FILES) | xargs -t -n1 unlink

# }}}
# Vim {{{

.PHONY: vim-plugins
vim-plugins: ## Installs all of the vim plugins
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +'PlugInstall --sync' +qa

# TODO: should this be managed by nvim config?
nvim-lsp: ## Install language servers for neovim LSP
	npm install -g typescript typescript-language-server
	npm install -g pyright 
	npm install -g vscode-langservers-extracted
	$(INSTALL) clang

# }}}
# Meat and potatoes {{{

.PHONY: programs
programs: ## Installs basic packages to get functioning on a new computer
	$(INSTALL) $(PACKAGES) $(ODDBALL_PACKAGES)

.PHONY: install
install: links zsh programs vim-plugins ## Take care of everything for fresh install

.PHONY: clean
clean: clean-zsh clean-links ## Removes everything except installed packages (and vim plugins)

# }}}
