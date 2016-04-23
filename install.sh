#!/bin/sh

# Generate the ssh key
ssh-keygen -t rsa

# --- Install Programs --- #
# Setup homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Then install homebrew cask
brew tap caskroom/cask
brew install caskroom/cask/brew-cask

# Install git first because cask needs git
brew install git # Git repositories
brew install npm # Package manager for javascript

brew install wget # Install wget
brew install tree # quickly view folder structure in terminal

brew cask install google-chrome # Web browser
brew cask install adium # Communication software
brew cask install skype # Communication software
brew cask install reeder # News reader
brew cask install vlc # Video player
brew cask install spotify # Music streaming
brew cask install dropbox # SkyDrive file manager

brew cask install dash # Gode documentation
brew cask iterm2 # A better terminal for Mac
brew cask alfred # A better terminal for Mac
brew cask caffeine # Prevent mac from sleeping

brew cask vagrant # Virtual mashine
brew cask virtualbox # Prevent mac from sleeping

brew cask slack # Team communication
brew cask 1password # Password manager

brew cask mindnode-pro # Mind mapping software
brew cask macvim # VIM Text editor for mac
brew cask moom # Mac window organization

brew cask transmit # FTP client

brew cask sequel-pro # Graphical SQL client
brew cask livereload # Reloads browser when you change your files developing web apps
brew cask rescuetime # Monitor your activities
brew cask graphviz # Write graphs in dot
brew cask textwrangler # Texteditor with GREP posibilities

# Setup vim rc file
git clone -b personal https://github.com/LasseHaslev/ultimate-vimrc.git ~/.vim/runtime
sh ~/.vim/runtime/install.sh

# Setup "oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add homestead
vagrant box add laravel/homestead
cd ~
git clone https://github.com/laravel/homestead.git Homestead
cd ~/Homestead
bash ./init.sh
