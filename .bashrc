#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/dotfiles/git-prompt.sh

if [ -f ~/.rvm/script/rvm ]; then
  source ~/.rvm/scripts/rvm
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

alias ls='ls --color=auto'
alias g='git'
alias gs='git status'

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(__git_ps1 " (%s)") \[\e[1;32m\]\$\[\e[m\] '
