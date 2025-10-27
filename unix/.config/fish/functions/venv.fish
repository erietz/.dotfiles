function venv
    argparse 'c/create=' -- $argv

    if set -q _flag_create
        set -l venv_name $_flag_create
        if test -n "$venv_name"
            echo "🐍 Creating venv $venv_name"
            python3 -m venv ~/.venvs/$venv_name
            echo "🐍 Activating $venv_name"
            source ~/.venvs/$venv_name/bin/activate.fish
        else
            echo "⚠️ Please provide a name for the venv"
        end
    else
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
end
