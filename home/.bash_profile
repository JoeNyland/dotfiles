# /etc/skel/.bash_profile

# Homebrew
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
[ -d /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && source ~/.bashrc

# Source ~/.profile if it exists
[[ -f ~/.profile ]] && source ~/.profile

export GPG_TTY=$(tty)
