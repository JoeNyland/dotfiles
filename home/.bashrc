# Source system bashrc
[ -f /etc/bashrc ] && source /etc/bashrc

# Unlimited Bash history
HISTSIZE=
HISTFILESIZE=

# Set the editor
export EDITOR=$(which vim)

# The usual Rsync options
alias rsync='rsync -avPh'

# Colour output and human readable units for ls
alias ls='ls -h --color'

# A more helpful sudo prompt
alias sudo='sudo -p "[sudo] password for %u: " '

# Colourful Grep
alias grep='grep --color'

# Set a colourful $PS1 prompt
PS1="\[\e[92;40m\]\h\[\e[m\]:\[\e[93m\]\W\[\e[m\] \\$ "

export BASH_SILENCE_DEPRECATION_WARNING=1

# Load Homebrew provided Bash autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Add Homebrew coreutils to $PATH
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
[ -d /usr/local/opt/coreutils/libexec/gnuman ] && export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Homeshick
[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ] && source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -s "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash" ] && source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

# Load AVN
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# Load RVM
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
