export BASH_CONF="bash_profile"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# If id command returns zero, you’ve root access.

if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\] "
else # normal
  PS1="[\\u@\\h:\\w] $ "
fi

fortune | cowsay | lolcat

# Add mysql to PATH
PATH="/usr/local/mysql/bin:${PATH}"
export PATH

# Add google app engine and android sdk tools to path
PATH="/usr/local/google_appengine:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH 

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
#export PATH

# Add bin directory for dart pub
export PATH="$PATH":"~/.pub-cache/bin"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
