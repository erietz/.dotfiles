#            __    _      __                        _____      
#     ____  / /_  (_)____/ /_     _________  ____  / __(_)___ _
#    / __ \/ __ \/ / ___/ __ \   / ___/ __ \/ __ \/ /_/ / __ `/
#   / /_/ / / / / (__  ) / / /  / /__/ /_/ / / / / __/ / /_/ / 
#  / .___/_/ /_/_/____/_/ /_/   \___/\____/_/ /_/_/ /_/\__, /  
# /_/                                                 /____/   

# Initialize Homebrew if it exists (Apple Silicon / Intel)
#
# This must be done first because it sets PATH and other important
# environment variables.
if test -x /opt/homebrew/bin/brew
	/opt/homebrew/bin/brew shellenv | source
else if test -x /usr/local/bin/brew
	/usr/local/bin/brew shellenv | source
end

# Commands to run in interactive sessions can go here
if status is-interactive
	if type -q starship
		starship init fish | source
	end

	if type -q mise
		mise activate fish | source
	end

	if type -q fzf
		fzf --fish | source
	end
end


function sp --description "Search in project with ripgrep + fzf + preview, open in nvim"
    if test (count $argv) -eq 0
        echo "Usage: sp <search-term>"
        return 1
    end

    rg --no-heading --line-number --color=always $argv |
    fzf --ansi \
        --delimiter : \
        --preview 'bat --style=numbers --color=always {1} --line-range {2}:+20' \
        --preview-window=up:40%:wrap |
    awk -F: '{print "+"$2" "$1}' |
    xargs -r nvim
end

function sf --description "Search files in project with fzf + preview, open in nvim"
    fd . |
    fzf --preview 'bat --style=numbers --color=always {} | head -200' |
    xargs -r nvim
end

# pnpm
set -gx PNPM_HOME "/Users/ethan/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Run pi in an isolated Docker container while sharing the current project and
# pi's settings/sessions. Project tools installed by mise persist in a volume.
function pi --description "Run pi in a Docker container"
    set -l docker_args --rm --init -i

    if isatty stdin; and isatty stdout
        set -a docker_args -t
    end

    set -a docker_args \
        --mount "type=bind,source=$PWD,target=$PWD" \
        --mount "type=bind,source=$HOME/.pi,target=/root/.pi" \
        --mount "type=volume,source=pi-mise-data,target=/root/.local/share/mise" \
        --workdir "$PWD"

    # Linked Git worktrees keep their metadata in the main checkout's .git
    # directory, outside the mounted worktree.
    set -l git_common (command git rev-parse --path-format=absolute --git-common-dir 2>/dev/null)
    if test -n "$git_common"; and not string match -q "$PWD/*" "$git_common"
        set -a docker_args --mount "type=bind,source=$git_common,target=$git_common"
    end

    for name in GH_TOKEN ANTHROPIC_API_KEY OPENAI_API_KEY GEMINI_API_KEY GOOGLE_API_KEY
        if set -q $name
            set -a docker_args --env $name
        end
    end

    docker run $docker_args pi-sandbox $argv
end

function pi-update --description "Rebuild the pi Docker image"
    docker build \
        --pull \
        --no-cache \
        -t pi-sandbox \
        -f "$HOME/.config/pi-container/Dockerfile" \
        "$HOME/.config/pi-container"
end
