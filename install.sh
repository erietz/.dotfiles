#!/usr/bin/env bash

OS=$(uname -s)
BREWFILE="$HOME/.dotfiles/darwin/.config/Brewfile"
INSTALL_PACKAGES=false
LINK_GUI_DOTFILES=false

main() {
	parse_flags "$@"

	stow_verbose unix

	case "$OS" in
	Linux)
		if [ -f /etc/arch-release ]; then
			echo "Arch Linux detected."
			stow_verbose arch
		fi

		if [ "$LINK_GUI_PACKAGES" = true ]; then
			stow_verbose linux
		fi
		;;
	Darwin)
		stow_verbose darwin
		if [ "$INSTALL_PACKAGES" = true ]; then
			install_packages_darwin
		fi
		;;
	*) echo "Unknown os" && exit 1 ;;
	esac
}

parse_flags() {
	while [[ "$#" -gt 0 ]]; do
		case "$1" in
		--install-packages)
			INSTALL_PACKAGES=true
			shift
			;;
		--gui)
			LINK_GUI_DOTFILES=true
			shift
			;;
		*) echo "Unknown option: $1" && exit 1 ;;
		esac
	done
}


stow_verbose() {
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
