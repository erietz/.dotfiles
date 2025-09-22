function venv
	set -l venvs (find ~/.venvs -maxdepth 1 -type d | tail -n +2)
    set -l selection (printf "%s\n" $venvs | fzf --prompt="Select venv> ")

    if test -n "$selection"
        if test -f "$selection/bin/activate.fish"
            echo "🐍 Activating $selection"
            source "$selection/bin/activate.fish"
        else
            echo "⚠️ No activate.fish found in $selection"
        end
    end
end
