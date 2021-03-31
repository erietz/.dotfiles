# TODO: figure out how to implement this: ln -s $(which fdfind) ~/.local/bin/fd

.DEFAULT_GOAL := help
.PHONY: Reset Red Green Yellow help
Reset        := "\\033[0m"
Red          := "\\033[31m"
Green        := "\\033[32m"
Yellow       := "\\033[33m"
help: ## Print this help message
	@echo "$(Yellow)--------------------------------------------------------------------------------$(Reset)"
	@echo "$(Green)                            Usage of this makefile                               $(Reset)"
	@echo "$(Yellow)--------------------------------------------------------------------------------$(Reset)"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/:.*##/:/' | column -t -s :
	@echo
	@echo "For a dry run use $(Green)make -n <target>$(Reset)"
	@echo "$(Yellow)--------------------------------------------------------------------------------$(Reset)"


# Find package manager and programs to install----------------------------------
PACMAN := $(shell which pacman >/dev/null 2>&1 || (echo "Your command failed with $$?"))
APT := $(shell which apt-get >/dev/null 2>&1 || (echo "Your command failed with $$?"))
BREW := $(shell which brew >/dev/null 2>&1 || (echo "Your command failed with $$?"))

ifeq (, $(PACMAN))
	INSTALL := sudo pacman -Sy
	ODDBALL_PACKAGES := fd pip3
else ifeq (, $(APT))
	INSTALL := sudo apt-get install -y
	ODDBALL_PACKAGES := fd-find python3-pip
else ifeq (, $(BREW))
	INSTALL := brew install
	ODDBALL_PACKAGES := fd pip3 koekeishiya/formulae/yabai koekeishiya/formulae/skhd
else
	$(error no installer found)
endif

PACKAGES := neovim \
	fzf \
	ripgrep \
	python3 \
	nodejs \
	npm \
	yarn \
	bat

# Find dotfiles-----------------------------------------------------------------
DOTLESS_FILES := $(wildcard config/*)
DOTLESS_FILES += zshenv
DOTLESS_FILES += local/ebin
DOT_FILES := $(addprefix $(HOME)/.,$(DOTLESS_FILES))

# ZSH related-------------------------------------------------------------------
ZSHDOTDIR := $(HOME)/.config/zsh

zsh: $(HOME)/.git-prompt.sh $(ZSHDOTDIR)/zsh-autosuggestions $(ZSHDOTDIR)/zsh-syntax-highlighting $(ZSHDOTDIR)/zsh-completions  ## Install zsh and change default interactive shell to zsh 

	$(INSTALL) zsh
	chsh -s $(shell which zsh)

$(HOME)/.git-prompt.sh:
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o $@

$(ZSHDOTDIR)/zsh-autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $@

$(ZSHDOTDIR)/zsh-syntax-highlighting:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $@

$(ZSHDOTDIR)/zsh-completions:
	git clone https://github.com/zsh-users/zsh-completions.git $@

# Sybolic link related----------------------------------------------------------
dirs:
	mkdir -p ~/.config ~/.local

links: dirs $(DOT_FILES) ## Create symlinks all dotfiles if they don't exists

# How to build a dotfile from a dotless file
$(HOME)/.%: %
	ln -s $(HOME)/.ewr/$^ $@

clean: ## Remove all symbolic links
	for file in $(DOT_FILES); do unlink $$file; done

# Required to get vim working---------------------------------------------------
vim-plugins:
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa

programs:
	@echo "$(Green)-------Go grab a coffee---------$(Reset)"
	$(INSTALL) $(PACKAGES) $(ODDBALL_PACKAGES)
	@echo "$(Green)-------Now get to work----------$(Reset)"

install: zsh programs vim-plugins links ## Take care of everything for fresh install
