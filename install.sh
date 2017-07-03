#!/usr/bin/env bash
# Install the bash configuration files on the current system

echo Installing personal bash settings...

# back up the old profile just in case
if [ ! -d "~/bak" ]; then
  mkdir ~/bak
fi
cp ~/.bash_profile ~/bak/.bash_profile.$(date +%Y%m%d%H%M)
cp ~/.bash_aliases ~/bak/.bash_aliases.$(date +%Y%m%d%H%M)

# copy over the latest files
cp ./.bash_profile ~/
cp ./.bash_aliases ~/

# update settings based on these files
source ~/.bash_profile
source ~/.bash_aliases

echo Done!
