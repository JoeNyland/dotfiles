# Source system bashrc
[ -f /etc/bashrc ] && source /etc/bashrc

# Unlimited Bash history
HISTSIZE=
HISTFILESIZE=

# The usual Rsync options
alias rsync='rsync -avPh'

# Colour output and human readable units for ls
alias ls='ls -h --color'

# A more helpful sudo prompt
alias sudo='sudo -p "[sudo] password for %u: " '

# Colourful Grep
alias grep='grep --color'
