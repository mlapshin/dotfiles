#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="emacsclient -t"

source ~/dotfiles/git-prompt.sh
source ~/dotfiles/knife-complete.sh

if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
  PATH=$PATH:$HOME/.rvm/bin
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [ -f /usr/share/git/completion/git-completion.bash ]; then
  source /usr/share/git/completion/git-completion.bash
fi

alias ls='ls --color=auto'
alias g='git'
alias gs='git status'
alias e='emacsclient -t'
alias tmx='tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME'

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(__git_ps1 " (%s)") \[\e[1;32m\]\$\[\e[m\] '
