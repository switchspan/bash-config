#!/usr/bin/env bash
# Install the bash configuration files on the current system
BACKUP_DIR=~/bak

echo Installing personal bash settings...

# back up the old profile just in case
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir $BACKUP_DIR
fi
cp ~/.bash_profile ~/bak/.bash_profile.$(date +%Y%m%d%H%M)
cp ~/.bash_aliases ~/bak/.bash_aliases.$(date +%Y%m%d%H%M)
cp ~/.profile ~/bak/.profile.$(date +%Y%m%d%H%M)

# check for git and install it if it doesn't exist
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.'
  apt-get install git --yes
else
  git config --global core.editor "vim"
fi

# copy over the latest files
cp ./.bash_profile ~/
cp ./.bash_aliases ~/
cp ./.profile ~/

# update settings based on these files
source ~/.bash_profile
source ~/.bash_aliases
source ~/.profile

echo Done!
