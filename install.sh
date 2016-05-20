#!/bin/sh

# --- Install Programs --- #
# Setup homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Then install homebrew cask
brew tap caskroom/cask
brew install caskroom/cask/brew-cask

# Install git first because cask needs git
brew cask install google-chrome # Web browser
brew cask install franz # Social messenger software
brew cask install skype # Communication software
brew cask install spotify # Music streaming
brew cask install dropbox # SkyDrive file manager

brew cask install alfred # A better terminal for Mac
brew cask install caffeine # Prevent mac from sleeping

brew cask install 1password # Password manager

# A fun little detail when the script has been finished
say -v whisper "It has been done"
