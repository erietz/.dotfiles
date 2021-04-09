# Author: Ethan Rietz
# Date: 04/01/2021
# Description: Deploy my dotfiles

# TODO: figure out how to implement this: ln -s $(which fdfind) ~/.local/bin/fd

# {{{ Help

.DEFAULT_GOAL := help
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
# {{{ Package manager and packages

# Find package manager (some versions of "which" print text even when not found)
PACMAN := $(shell which pacman >/dev/null 2>&1 || (echo "Your command failed with $$?"))
APT := $(shell which apt-get >/dev/null 2>&1 || (echo "Your command failed with $$?"))
BREW := $(shell which brew >/dev/null 2>&1 || (echo "Your command failed with $$?"))

ifeq (, $(PACMAN))
	INSTALL := sudo pacman -Sy
	ODDBALL_PACKAGES := fd python-pip
else ifeq (, $(APT))
	INSTALL := sudo apt-get install -y
	ODDBALL_PACKAGES := fd-find python3-pip
else ifeq (, $(BREW))
	INSTALL := brew install
	ODDBALL_PACKAGES := fd pip3 koekeishiya/formulae/yabai koekeishiya/formulae/skhd
else
	$(error no installer found)
endif

# All of these packages are currently required by neovim config
# TODO: Get on native nvim lsp since coc requires so much stuff
PACKAGES := neovim fzf ripgrep python3 nodejs npm yarn bat jq

# }}}
# {{{ ZSH

ZDOTDIR := $(HOME)/.config/zsh
ZSHPLUGINS := zsh-autosuggestions zsh-syntax-highlighting zsh-completions
ZSHPLUGIN_PATHS := $(addprefix $(ZDOTDIR)/,$(ZSHPLUGINS))

.PHONY: zsh
zsh: $(HOME)/.git-prompt.sh ## Install zsh and change default interactive shell to zsh 

	$(INSTALL) zsh
	chsh -s $(shell which zsh)

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
# {{{ Symbolic links

# These dirs need to exist before symlinks are created
DIRS := $(HOME)/.config $(HOME)/.local

# Manual control of which files are symlinked
# NOTE: Another approach is to use $(shell find .) then filter out .gitignore etc.
DOTLESS_FILES := $(wildcard config/*)
DOTLESS_FILES += zshenv
DOTLESS_FILES += local/ebin
DOTLESS_FILES += Xmodmap
DOT_FILES := $(addprefix $(HOME)/.,$(DOTLESS_FILES))

$(DIRS):
	mkdir -p $@

.PHONY: links
links: $(DIRS) $(DOT_FILES) ## Create symlinks all dotfiles if they don't exists

# How to build a dotfile from a dotless file
$(HOME)/.%: %
	ln -s $(HOME)/.ewr/$^ $@

.PHONY: clean-links
clean-links: ## Remove all symbolic links
	for file in $(DOT_FILES); do unlink $$file; done
# }}}
# {{{ Vim

.PHONY: vim-plugins
vim-plugins: ## Installs all of the vim plugins
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa

# TODO: clean-vim (how to determine where plugins are installed?)

# }}}
# {{{ Meat and potatoes

.PHONY: programs
programs: ## Installs basic packages to get functioning on a new computer
	$(INSTALL) $(PACKAGES) $(ODDBALL_PACKAGES)

.PHONY: install
install: zsh programs vim-plugins links ## Take care of everything for fresh install

.PHONY: clean
clean: clean-zsh clean-links ## Removes everything except installed packages (and vim plugins)

# }}}

# vim: foldmethod=marker
