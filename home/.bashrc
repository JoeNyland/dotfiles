# Source system bashrc
[ -f /etc/bashrc ] && source /etc/bashrc

# Unlimited Bash history
HISTSIZE=
HISTFILESIZE=

# The usual Rsync options
alias rsync='rsync -avPh'

# Colour output and human readable units for ls
alias ls='ls -h --color'
