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
brew install caskroom/cask/brew-cask git mongodb node pandoc wget unrar nginx
# Install software
brew cask install atom dropbox firefox github launchrocket robomongo onyx vagrant vlc chromium gimp iterm2 virtualbox sublime-text docker boot2docker fig

# Cleanup
brew cleanup
brew cask cleanup

# Audit installation
brew doctor
brew cask doctor

exit 0
