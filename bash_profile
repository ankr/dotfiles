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

# Showing current branch when in git repos
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1="\h:\w \u\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "
