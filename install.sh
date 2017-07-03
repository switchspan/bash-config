#!/usr/bin/env bash
# Install the bash configuration files on the current system

echo Installing personal bash settings...

# back up the old profile just in case
mkdir ~/bak
cp ~/.bash_profile ~/bak/
cp ~/.bash_aliases ~/bak/

# copy over the latest files
cp ./.bash_profile ~/
cp ./.bash_aliases ~/

# update settings based on these files
source ~/.bash_profile
source ~/.bash_aliases

echo Done!
