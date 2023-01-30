##!/bin/sh
#
# Homebrew
#
open https://brew.sh/

# Update
brew update --all
brew upgrade

# Install
brew install iterm2 visual-studio-code slack firefox google-chrome chromium spotify spectacle

# Cleanup
brew cleanup

# Audit installation
brew doctor

exit 0
