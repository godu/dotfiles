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
brew install caskroom/cask/brew-cask docker docker-compose docker-machine elasticsearch git graphviz htop mongodb node pandoc python redis unrar wget
brew tap caskroom/versions
# Install software
brew cask install atom battle-net chromium dropbox firefoxdeveloperedition gimp google-chrome iterm2-nightly java launchrocket minecraft onyx robomongo skype slack spotify sublime-text3 transmission vagrant virtualbox visual-studio-code vlc xmind xquartz

# Cleanup
brew cleanup
brew cask cleanup

# Audit installation
brew doctor
brew cask doctor

exit 0
