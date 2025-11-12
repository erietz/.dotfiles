#!/usr/bin/env bash

OS=$(uname -s)
BREWFILE="$HOME/.dotfiles/unix/.config/Brewfile"

main() {
	stow_it unix

	case "$OS" in
		Linux)
			stow_it linux
			;;
		Darwin)
			stow_it darwin
			install_homebrew_packages
			;;
		*) echo "Unknown os" && exit 1 ;;
	esac
}

stow_it() {
	stow -v $1
}

install_homebrew_packages() {
	echo "🧩 Installing Homebrew if not present..."
	if ! command -v brew &>/dev/null; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	echo "🍺 Installing Brew packages..."
	brew bundle --file="$BREWFILE"
}

main
