export ZDOTDIR="$HOME/.zsh"
# Prompt Customization ---------------------------------------------------------

DEFAULT=$PS1
#fuchsia=$(tput setaf 125)
#orange=$(tput setaf 130)
#purple=$(tput setaf 99)
#lime=$(tput setaf 10)
#yellow=$(tput setaf 226)
#red=$(tput setaf 160)
#blue=$(tput setaf 033)
#green=$(tput setaf 41)
#olive=$(tput setaf 100)
#brown=$(tput setaf 130)
#grey=$(tput setaf 238)
#cream=$(tput setaf 222)
#reset=$(tput sgr0)
#
#PS1="\[${red}\][" 
#PS1+="\[${blue}\]\u"
#PS1+="\[${fuchsia}\]@"
#PS1+="\[${green}\]\h"
#PS1+="\[${fuchsia}\]:"
#PS1+="\[${orange}\]\w"
#PS1+="\[${red}\]]"
#PS1+="\[${fuchsia}\]\$ \[${reset}\]"

# Colors
black="\[$(tput setaf 0)\]"
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
magenta="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"

# Title bar - "user@host: ~"
#title="\u@\h: \w"
#titlebar="\[\033]0;"$title"\007\]"

# Git branch
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /';
}

# Clear attributes
clear_attributes="\[$(tput sgr0)\]"

# Custom bash prompt - "➜  ~ (master) "
#export PS1="${titlebar}${green}➜  ${blue}\w ${cyan}\$(git_branch)${clear_attributes}"
export PS1="${magenta}\h ${yellow}\w ${cyan}\$(git_branch)${magenta}» ${clear_attributes}"
