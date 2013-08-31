#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/go/bin:$HOME/.rbenv/bin:$HOME/bin:$HOME/.carton/bin:$PATH"
export GOPATH="$HOME/go"

if [ $HOSTNAME = "rusty" ]; then
    eval "$(rbenv init -)"
    eval $(ssh-agent)
fi
