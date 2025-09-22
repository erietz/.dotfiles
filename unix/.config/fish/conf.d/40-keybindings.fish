function tmux_sess
    tmux popup -E "tmux-sessionizer"
end

function git_chob
    if test "$argv[1]" = "-r"
        git branch -r | fzf | awk -F 'origin/' '{print $2}' | xargs -I {} git checkout -b "{}" "origin/{}"
    else
        git branch | fzf | awk '{print $NF}' | xargs git checkout
    end
end

function git_chob_remote
	git_chob -r
end



bind -M insert \cp tmux_sess
bind -M insert \cg git_chob
bind -M insert \cb git_chob_remote
