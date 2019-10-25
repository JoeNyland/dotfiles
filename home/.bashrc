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

# Set a colourful $PS1 prompt
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

# Load Homebrew provided Bash autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Add Homebrew coreutils to $PATH
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
[ -d /usr/local/opt/coreutils/libexec/gnuman ] && export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
