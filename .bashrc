#!/usr/bin/bash
#
# bash startup file

MYNAME=

# -----------------------------------------
# .bashenv
PS1='\h:\w\$ '
PS2='> '

# -----------------------------------------
#

export HOME=/export/home/$MYNAME
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/gcc/bin:/usr/local/ssl/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/ccs/bin:/usr/sfw/b
in:/usr/openwin/bin:/usr/ucb:/usr/dt/bin

export CC='gcc -m64'
export CXX='g++ -m64'

export LD_LIBRARY_PATH_64=/usr/local/lib:/usr/local/gcc/lib/sparcv9:/usr/local/ssl/lib:/usr/sfw/lib/64:/usr/lib/64:/lib/64:/usr/ccs/li
b/sparcv9:/usr/openwin/lib/64:/usr/dt/lib/64:.
export LD_LIBRARY_PATH_32=/usr/sfw/lib:/usr/lib:/lib:/usr/ccs/lib:/usr/openwin/lib

export MANPATH=/usr/local/man:/usr/local/gcc/man:/usr/local/ssl/lib:/usr/sfw/man:/usr/man:/usr/openwin/man

export PAGER=less
export LESS=-cigMnQx4
export JLESSCHARSET='japanese'
export EDITOR=vi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -Fa'
alias vi='vim'

HISTSIZE=256
HISTFILE=$HOME/.bash_history
