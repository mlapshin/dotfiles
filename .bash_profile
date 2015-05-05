#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.rbenv/bin:$HOME/bin:$HOME/.cask/bin:$PATH"

if [ $HOSTNAME = "rusty" ]; then
    eval "$(rbenv init -)"
    eval $(ssh-agent)
fi
