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
end
