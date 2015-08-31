#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLICOLOR="1";
source ~/dotfiles/git-prompt.sh

alias g='git'
alias gs='git status'
alias tmx='tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME'

alias v='vagrant'

source ~/dotfiles/git-completion.bash
__git_complete g _git

alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/emacsclient'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias e='emacsclient -nw'

export NVM_DIR="/Users/mlapshin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(__git_ps1 " (%s)") \[\e[1;32m\]\$\[\e[m\] '
