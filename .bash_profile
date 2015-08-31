#
# ~/.bash_profile
#

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.rbenv/bin:$HOME/bin:$HOME/.cask/bin:$PATH"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

[[ -f ~/.bashrc ]] && . ~/.bashrc
