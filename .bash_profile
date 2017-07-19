export BASH_CONF="bash_profile"
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR=vim

# If id command returns zero, you have root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\] "
else # normal
  PS1="[\\u@\\h:\\w] $ "
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# install git if it is not installed
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
else
  # Set git to use the credential memory cache
  git config --global credential.helper cache
  # Set the cache to timeout after 1 hour (setting is in seconds)
  git config --global credential.helper 'cache --timeout=3600'
fi

# install curl if it is not installed
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

# update the vim config
if [ ! -f "$HOME/.vimrc" ]; then
    curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=javascript&langs=php&langs=html&langs=ruby&langs=perl&langs=lua&langs=c&langs=python&editor=vim' > ~/.vimrc
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
