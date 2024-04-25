# /etc/skel/.bash_profile

# Homebrew
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
[ -d /usr/local/bin ] && export PATH="/usr/local/bin:$PATH"
[ -d /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"
[ -d /usr/local/sbin ] && export PATH="/usr/local/sbin:$PATH"

# Source ~/.profile if it exists
[[ -f ~/.profile ]] && source ~/.profile

# Source profile containing secrets if it exists
[[ -f ~/.secret_profile ]] && source ~/.secret_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && source ~/.bashrc

export GPG_TTY=$(tty)
