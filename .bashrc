# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export TERM=rxvt-unicode-256color
eval $(dircolors $HOME/.dotfiles/modules/dircolors-solarized/dircolors.ansi-dark)

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

alias c++11='$CXX -std=c++11'

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias vivim='vi ~/.vimrc'
alias vibash='vi ~/.bashrc && source ~/.bashrc'
alias sauce='source ~/.bashrc'

function uid
{
  echo "id`uuidgen | awk '{ print toupper($0) }' | tr -d '-'`_H"
}

