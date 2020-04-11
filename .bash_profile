<<<<<<< HEAD
export SHELL=/bin/zsh
exec /bin/zsh -l
=======
### pyenv
#export PYENV_ROOT="/N/slate/ewrietz/.pyenv"
###
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#pyenv activate anaconda3-2019.10

# Don't initialize pyenv if it is already initialized.
# # See: https://github.com/pyenv/pyenv/issues/264#issuecomment-358490657
#if [ -n "$PYENV_LOADING" ]; then
#	true
#else
#	if which pyenv > /dev/null 2>&1; then
#		export PYENV_LOADING="true"
#		eval "$(pyenv init -)"
#		eval "$(pyenv virtualenv-init -)"
#		unset PYENV_LOADING
#	fi
#fi

export SHELL=/bin/zsh
exec /bin/zsh -l

#export SHELL=$(which zsh)
#exec $(which zsh) -l
>>>>>>> origin/master

#if [ -f ~/.profile ]; then
#	source ~/.profile
#fi
#
#if [ -f ~/.bashrc ]; then
#	source ~/.bashrc
#fi
#
#if [ -x /usr/bin/fortune ] ; then
#    echo
#    /usr/bin/fortune
#    echo
#fi
#
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
#
