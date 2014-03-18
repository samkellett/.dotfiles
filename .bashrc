# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

alias c++11='$CXX -std=c++11'

function wpuid
{
  echo "id`uuidgen | awk '{ print toupper($0) }' | tr -d '-'`_H"
}

# User specific aliases and functions
