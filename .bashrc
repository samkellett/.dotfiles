export EDITOR=vim

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig

# Homebrew gets priority:
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

export PATH="$PATH:$HOME/.cabal/bin:$PATH"

# pwd gets last chance:
export PATH="$PATH:."

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export GREP_OPTIONS='--color=auto'

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

alias ll='ls -l'
alias la='ls -a'
alias lh='ls -lh'
alias lla='ls -la'

alias clr='for i in {1..50}; do echo; done'

alias vivim='vi ~/.vimrc'
alias vibash='vi ~/.bash_profile && sauce && echo source ~/.bash_profile'
alias sauce='source ~/.bash_profile'

alias qtcreator='open -a "Qt Creator"'
alias sublime='open -a "Sublime Text 2"'
alias google-chrome='open -a "Google Chrome"'
alias gitx='open -a "GitX"'

alias c++11='g++ -std=c++11 -stdlib=libc++'

