# Source the isocon theme matching the current macOS appearance, and point
# lazygit at the matching theme file layered on top of the user's own config.
if defaults read -g AppleInterfaceStyle 2>/dev/null | string match -q Dark
    source ~/.config/fish/themes/isocon-dark.fish
    set -gx LG_CONFIG_FILE $HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/isocon-dark.yml
else
    source ~/.config/fish/themes/isocon-light.fish
    set -gx LG_CONFIG_FILE $HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/isocon-light.yml
end
