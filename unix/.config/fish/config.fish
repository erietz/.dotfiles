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
