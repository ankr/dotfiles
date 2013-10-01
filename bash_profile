# vim as default editor
export EDITOR=vim

# ls aliasses
alias l="ls -l"
alias ll="ls -la"

# navigation aliases
alias ..="cd ../"
alias ...="cd ../../"

# aliases changing default behaviors
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias less="less -r"
alias tree="tree -C"

# convenience aliases
alias scls="screen -ls"
alias syntax="find . -name '*.php' -exec php -l {} \;" # php syntax check in current folder (+subs)
alias grin='grep -rin'
alias now='date +"%T"'

# Color prompt
if [[ $EUID == 0 ]] ;
then
	export PS1='\[\e[1;31m\]\u \[\e[0m\]@ \[\e[1;33m\]\H \[\e[0m\][ \[\e[1;34m\]\w \[\e[0m\]]$(__git_ps1 " (%s)")\n\[\e[1m\]-> \[\e[0m\]'
else
	export PS1='\[\e[1;32m\]\u \[\e[0m\]@ \[\e[1;33m\]\H \[\e[0m\][ \[\e[1;34m\]\w \[\e[0m\]]$(__git_ps1 " (%s)")\n\[\e[1m\]-> \[\e[0m\]'
fi

# Adding brew bash_completion if available
if [ -f $(brew --prefix)/etc/bash_completion ];
then
	$(brew --prefix)/etc/bash_completion
fi
