#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/go/bin:$HOME/.rbenv/bin:$HOME/bin:$HOME/.cask/bin:$PATH"
export GOPATH="$HOME/go"

if [ $HOSTNAME = "rusty" ]; then
    eval "$(rbenv init -)"
    eval $(ssh-agent)
fi

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
