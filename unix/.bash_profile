# TODO: why source .bashrc in .bash_profile?
. ~/.bashrc


# Safe and POSIX-compliant helper function for .profile
pathadd() {
    # Check if the directory exists
    if [ -d "$1" ]; then
        # Check if the directory is already in PATH using case matching
        case ":$PATH:" in
            *":$1:"*) ;; # Already there, do nothing
            *) export PATH="$1:$PATH" ;; # Not there, add it
        esac
    fi
}

pathadd "$HOME/.local/bin"
pathadd "$HOME/go/bin"
. "$HOME/.cargo/env"
pathadd "/opt/homebrew/opt/mysql@8.0/bin"

export EDITOR=nvim
export VISUAL=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
