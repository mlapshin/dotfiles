#
# ~/.bash_profile
#

export GOPATH="$HOME/work/go"
export PATH="/Users/mlapshin/bin:$GOPATH/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mlapshin/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mlapshin/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mlapshin/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mlapshin/Downloads/google-cloud-sdk/completion.bash.inc'; fi
