##!/bin/sh

# Homebrew - https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update
brew update --all
brew upgrade

# Install
brew install ghcup
brew install --cask authy chromium docker firefox google-chrome iterm2 slack spectacle spotify visual-studio-code

# Node Manager - https://github.com/Schniz/fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "./.fnm" --skip-shell

# Cleanup
brew cleanup

# Audit installation
brew doctor

exit 0
