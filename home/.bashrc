# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't save commands that start with a space to ~/.bash_history
# Don't save duplicate commands to ~/.bash_history and erase any duplicates
HISTCONTROL="ignoreboth:ignoredups:erasedups"

# append to the history file, don't overwrite it
shopt -s histappend

# Unlimited Bash history
HISTSIZE=
HISTFILESIZE=

# Add the date and time to history command output
HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set the editor
export EDITOR=$(which vim)

export BASH_SILENCE_DEPRECATION_WARNING=1

# Load Homebrew provided Bash autocompletion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Add Homebrew coreutils to $PATH
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
[ -d /opt/homebrew/opt/coreutils/libexec/gnubin ] && export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
[ -d /usr/local/opt/coreutils/libexec/gnuman ] && export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
[ -d /opt/homebrew/opt/coreutils/libexec/gnuman ] && export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

# enable color support of ls and also add handy aliases
if command -v dircolors &> /dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load NVM
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Homeshick
[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ] && source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[ -s "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash" ] && source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

# Load AVN
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# Add user-level Python bin to $PATH
[ -d "$HOME/Library/Python/3.11/bin" ] && export PATH=$PATH:~/Library/Python/3.11/bin

# Add Homebrew provided Python to $PATH
[ -d "/opt/homebrew/opt/python@3.11/libexec/bin" ] && export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:${PATH}"

# Load RVM
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[ -d "$HOME/.rvm/bin" ] && export PATH="$PATH:$HOME/.rvm/bin"

# Start a GPG agent on macOS
[[ $(uname -s) == Darwin* ]] && gpgconf --launch gpg-agent

# Disable Homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

# Enabled colour output from Python packages
# Required as tmux seems to do something which disabled colours from Python packages. Adding this re-enables colour output.
export PY_COLORS=1

# Needed to support installing from bottles on unsupported macOS version
export HOMEBREW_NO_INSTALL_FROM_API=1
