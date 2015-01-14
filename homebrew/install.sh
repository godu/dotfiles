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
brew update
brew upgrade

# Install package
brew install brew-cask git mongodb node pandoc wget unrar nginx
# Install software
brew cask install atom firefox github launchrocket robomongo onyx vagrant vlc chromium gimp iterm2 virtualbox

# Cleanup
brew cleanup
brew cask cleanup

# Audit installation
brew doctor
brew cask doctor

exit 0
