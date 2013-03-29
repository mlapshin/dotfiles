#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.rbenv/bin:$HOME/bin:$HOME/.carton/bin:$PATH"

if [ $HOSTNAME = "rusty" ]; then
    eval "$(rbenv init -)"
    eval $(ssh-agent)
fi
