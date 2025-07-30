# profile zsh startup time
# zmodload zsh/zprof

# basic settings {{{

# load terminal colors
autoload -U colors && colors

# safety
set -o noclobber
setopt append_create
alias cp='cp -i'
alias mv='mv -i'

# tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
setopt globdots
_comp_options+=(globdots)   # include hidden files
setopt COMPLETE_ALIASES

# Make Zsh history shared and real-time across sessions
setopt SHARE_HISTORY       # Share history between sessions
setopt INC_APPEND_HISTORY  # Append history immediately, not on exit
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Optional: Prevent overwriting history from other sessions
setopt APPEND_HISTORY


# }}}
# keybindings {{{

bindkey -v  # vim
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Expand aliases
bindkey '^k' _expand_alias

# }}}
# source other files {{{

export EWR_PLUGIN_DIR="${HOME}/.config/ewr-plugins"

source_files=(
	$ZDOTDIR/$computer.zsh
	$ZDOTDIR/unix.zsh
	$EWR_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	$EWR_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
	$EWR_PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh
	# $EWR_PLUGIN_DIR/git-prompt.sh
)

case $OSTYPE in
	darwin*) source_files+=($ZDOTDIR/mac.zsh) ;;
	linux*) source_files+=($ZDOTDIR/linux.zsh) ;;
esac

for file in $source_files;
do
	[ -f $file ] && source $file
done

# }}}
# prompt {{{

# local prompt=''
# # prompt+='%{$fg[cyan]%}['
# prompt+='%{$fg[green]%}%n'       # $USERNAME
# prompt+='%{$fg[white]%}@'        # @
# prompt+='%{$fg[yellow]%}%m '      # hostname (up to first .)
# prompt+='%{$fg[blue]%}%~'        # working directory ($HOME replaced by ~)
# prompt+='%{$fg[white]%}$(__git_ps1 " (%s)")'  # git branch
# # prompt+='%{$fg[cyan]%}]'
# # prompt+=$'\n'
# # prompt+='%{$fg[red]%} ⚛'
# # prompt+='%{$fg[yellow]%} ☯'
# prompt+='%{$fg[white]%}> '
# prompt+='%{$reset_color%}'
# setopt PROMPT_SUBST ; PS1="${prompt}"



# }}}

# per machine settings that do not get tracked by git
[ -f ~/.zshrc-extra ] && source ~/.zshrc-extra

# {{{ gnuplot

function gplot() {
	local type=${1:-"bar"}
	local title=${2:-""}
	local xlabel=${3:-""}
	local ylabel=${4:-""}
	local terminal=${5:-"qt"}

	case $type in
		bar)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set style data histogram;
			set style fill solid;
			set boxwidth 0.8;
			set xtic rotate by -45 scale 0;
			set offset 0,0,2,0;
			plot '-' using 1:xtic(2) with boxes notitle"
			;;
		barh)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set style data histogram;
			set style fill solid;
			set boxwidth 0.8;
			set ytics rotate;
			set offset 2,0,0,0;
			plot '-' using 1:ytic(2) with boxes notitle"
			;;
		line)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set grid;
			plot '-' using 1:xtic(2) with linespoints lw 2 pt 7 notitle"
			;;
		scatter)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set grid;
			plot '-' using 1:2 with points pt 7 ps 1.5 notitle"
			;;
		hist)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set style fill solid 0.5;
			bin_width = 5;
			bin_number(x) = floor(x/bin_width);
			rounded(x) = bin_width * (bin_number(x) + 0.5);
			set boxwidth bin_width * 0.9;
			plot '-' using (rounded(\$1)):(1.0) smooth freq with boxes notitle"
			;;
		pie)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set size square 1,1;
			set parametric;
			set trange [0:2*pi];
			set xrange [-1.5:1.5];
			set yrange [-1.5:1.5];
			set grid;
			set angle degrees;
			unset key;
			unset border;
			unset tics;
			# Read data and compute percentages
			plot '-' using (0):(0):(1):(column(1)*360/100):(column(1)) with circles lc variable title''
			"
			;;
		heatmap)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set view map;
			set palette defined (0 'blue', 0.5 'white', 1 'red');
			set cblabel 'Value';
			plot '-' using 1:2:3 with image notitle"
			;;
		area)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set grid;
			set style fill transparent solid 0.5;
			plot '-' using 1:xtic(2) with filledcurves x1 notitle"
			;;
		boxplot)
			gnuplot -p -e "
			set terminal $terminal size 800,600 font 'Helvetica,10';
			set title '$title';
			set xlabel '$xlabel';
			set ylabel '$ylabel';
			set style fill solid 0.5;
			set style boxplot outliers pointtype 7;
			set style data boxplot;
			set boxwidth 0.5;
			plot '-' using (1):1 notitle"
			;;
		*)
			echo "Unknown plot type: $type"
			echo "Available types: bar, barh, line, scatter, hist, pie, heatmap, area, boxplot"
			return 1
			;;
	esac
}

# }}}

# {{{ stuff

function git-chob() {
	if [ "$1" = "-r" ]; then
		git branch -r | fzf | awk -F 'origin/' '{print $2}' | xargs -I {} git checkout -b "{}" "origin/{}"
	else
		git branch | fzf | awk '{print $NF}' | xargs git checkout
	fi
}

function _git-chob() {
	git-chob
	zle reset-prompt
}

zle -N _git-chob _git-chob
bindkey '^g' _git-chob

function _git-chob-remote() {
	git-chob -r
	zle reset-prompt
}

zle -N _git-chob-remote _git-chob-remote
bindkey '^b' _git-chob-remote

function _tmux-sessionizer() {
	# tmux popup -E -d -w 80% -h 80% -c "#{pane_current_path}" "tmux-sessionizer"
	tmux popup -E "tmux-sessionizer"
	zle reset-prompt
}

zle -N _tmux-sessionizer _tmux-sessionizer
bindkey '^p' _tmux-sessionizer

# }}}

command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# zprof
