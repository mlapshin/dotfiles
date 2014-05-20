#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="emacsclient -t"

if [ $HOSTNAME == "air.local" ]; then
  export CLICOLOR="1";
fi

source ~/dotfiles/git-prompt.sh

if ! [ $HOSTNAME == "air.local" ]; then
  PATH=$PATH:$HOME/.cask/bin

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

  if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
  fi

  alias ls='ls --color=auto'
fi

alias g='git'
alias gs='git status'
alias e='emacsclient -t'
alias tmx='tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME'

alias v='vagrant'

if [ $HOSTNAME == "air.local" ]; then
  source ~/dotfiles/git-completion.bash
  __git_complete g _git

  alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
  alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
else
  complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
      || complete -o default -o nospace -F _git g
fi

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(__git_ps1 " (%s)") \[\e[1;32m\]\$\[\e[m\] '
