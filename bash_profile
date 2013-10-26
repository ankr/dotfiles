# vim as default editor
export EDITOR=vim

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

# Make sure `have` is defined
have() {
	unset -v have
	PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null &&
	have="yes"
}

# Load bash completions
if [ -d /etc/bash_completion.d ] ; then
	for file in /etc/bash_completion.d/* ; do
		source "$file"
	done
fi

# Adding brew bash_completion if available
if command -v brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ] ; then
	source $(brew --prefix)/etc/bash_completion
fi

# Shows PS1 like:
# $user @ $host [$pwd] ($gitbranch)
# Color prompt
if [[ $EUID == 0 ]] ; then
	export PS1='\[\e[1;31m\]\u \[\e[0m\]@ \[\e[1;33m\]\H \[\e[0m\][ \[\e[1;34m\]\w \[\e[0m\]] $(__git_ps1 " (%s)")\n\[\e[1m\]-> \[\e[0m\]'
else
	export PS1='\[\e[1;32m\]\u \[\e[0m\]@ \[\e[1;33m\]\H \[\e[0m\][ \[\e[1;34m\]\w \[\e[0m\]] $(__git_ps1 " (%s)")\n\[\e[1m\]-> \[\e[0m\]'
fi

# Read .bash_custom
if [ -f ~/.dotfiles/bash_custom ] ; then
	source ~/.dotfiles/bash_custom
fi

