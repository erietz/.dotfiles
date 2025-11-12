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
	if ! command -v brew &>/dev/null; then
		echo "🧩 Homebrew is not install... installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	echo "🍺 Installing Brew packages..."
	brew bundle --file="$BREWFILE"
}

main
