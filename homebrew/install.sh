##!/bin/sh
#
# Homebrew
#
if test ! $(which brew)
then
echo " Installing Homebrew for you."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update
brew update --all
brew upgrade

# Install package
brew install caskroom/cask/brew-cask git mongodb node pandoc wget unrar nginx docker docker-compose elasticsearch
brew tap caskroom/versions
# Install software
brew cask install java atom dropbox firefoxdeveloperedition github launchrocket robomongo omnigraffle-professional5 onyx vagrant visual-studio-code vlc chromium gimp iterm2-nightly virtualbox sublime-text3 slack minecraft skype universal-media-server

# Cleanup
brew cleanup
brew cask cleanup

# Audit installation
brew doctor
brew cask doctor

exit 0
