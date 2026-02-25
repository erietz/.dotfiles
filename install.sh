#!/usr/bin/env bash

OS=$(uname -s)
BREWFILE="$HOME/.dotfiles/darwin/.config/Brewfile"
INSTALL_PACKAGES=false


parse_flags() {
	while [[ "$1" == -* ]]; do
		case "$1" in
		--install-packages)
			INSTALL_PACKAGES=true
			shift
			;;
		*) echo "Unknown option: $1" && exit 1 ;;
		esac
	done
}

main() {
	parse_flags "$@"

	stow_it unix

	case "$OS" in
	Linux)
		stow_it linux
		;;
	Darwin)
		stow_it darwin
		if [ "$INSTALL_PACKAGES" = true ]; then
			install_packages_darwin
		fi
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
