##!/bin/sh
#
# Homebrew
#
open https://brew.sh/

# Update
brew update --all
brew upgrade

brew install iterm2 visual-studio-code slack firefox google-chrome chromium spotify spectacle

# Cleanup
brew cleanup
brew cask cleanup

# Audit installation
brew doctor
brew cask doctor

exit 0
