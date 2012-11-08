#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.rbenv/bin:/home/sotakone/bin:$PATH"

if [ $HOSTNAME = "rusty" ]; then
    eval "$(rbenv init -)"
    eval $(ssh-agent)
fi
