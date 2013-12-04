# vim as default editor
export EDITOR=vim

export PATH="/usr/local/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# history
shopt -s histappend
shopt -s cmdhist
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups
export HISTIGNORE='ls:ll:l:history'
export HISTTIMEFORMAT='%F %T '

# make `ls` show colors
if [ $(uname) == "Linux" ] ; then
	alias ls='ls --color=auto'
else # OS X
	alias ls='ls -G'
fi

# aliases changing default behaviors
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias less="less -r"
alias tree="tree -C"
alias sublime="sublime -a"

# ls aliasses
alias l="ls -l"
alias ll="ls -la"

# navigation aliases
alias ..="cd ../"
alias ...="cd ../../"

# convenience aliases
alias scls="screen -ls"
alias syntax="find . -name '*.php' -exec php -l {} \;"
alias grin='grep -rin'
alias psa="ps aux"
alias psg="ps aux | grep $0"

# return the machines local IP address
function intip {
	local INTF=`route get default | grep interface | awk '{print $2}'`
	local IP=`ifconfig $INTF | grep 'inet ' | cut -d ' ' -f 2`
	echo $IP
}

# return the machines public IP address
function extip {
	local IP=`curl -sS http://checkip.dyndns.org | awk '{print $6}' | awk 'BEGIN {FS = "<"} {print $1}'`
	echo $IP
}

# make sure `have` is defined
have() {
	unset -v have
	PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null &&
	have="yes"
}

# load bash completions
if [ -d /etc/bash_completion.d ] ; then
	for file in /etc/bash_completion.d/* ; do
		source "$file"
	done
fi

# adding brew bash_completion if available
if command -v brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ] ; then
	source $(brew --prefix)/etc/bash_completion
fi

# shows PS1 like:
# $user @ $host [$pwd] ($gitbranch)
if [[ $EUID == 0 ]] ; then
	export PS1='\[\e[1;31m\]\u @ \H [ \w ] [ \D{%H:%M} ] $(__git_ps1 "( %s )")\n\[\e[1m\]-> \[\e[0m\]'
else
	export PS1='\[\e[1;31m\]\u \[\e[0m\]@ \[\e[1;33m\]\H \[\e[0m\][ \[\e[1;32m\]\w \[\e[0m\]] [ \D{%H:%M} ] $(__git_ps1 "( %s )")\n\[\e[1m\]-> \[\e[0m\]'
fi

# read .bash_custom
if [ -f ~/.dotfiles/bash_custom ] ; then
	source ~/.dotfiles/bash_custom
fi
