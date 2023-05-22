# /etc/skel/.bash_profile

# Homebrew
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
[ -d /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"

# Source ~/.profile if it exists
[[ -f ~/.profile ]] && source ~/.profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && source ~/.bashrc

export GPG_TTY=$(tty)

# Scaleway CLI autocomplete initialization.
command -v scw &> /dev/null && eval "$(scw autocomplete script shell=bash)"
