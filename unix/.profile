# ~/.profile       login-shell environment/setup
# ~/.bashrc        interactive Bash configuration
# ~/.bash_profile  Bash-specific login setup
#
# ~/.profile: executed by Bourne-compatible login shells.

# If the shell is Bash, source ~/.bashrc. This lets you keep interactive Bash
# configuration in .bashrc while .profile handles login-shell setup.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# Disables other users from writing directly to your terminal with write(1).
# The || true prevents failure from affecting shell startup.
mesg n 2> /dev/null || true
