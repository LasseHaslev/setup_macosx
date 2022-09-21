#!/bin/sh

# Ask for variables to use in this process
echo "Ok, to make this process alot easier, answer these questions:\nWhat is your name?"
read name;
echo "What is your email address?"
read email;

# Generate the ssh key
ssh-keygen -t rsa -b 4096 -C $email

# Adding your SSH key to the ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# --- Install Programs --- #
# Setup homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Then install homebrew cask
brew update

# First install and setup git because cask needs git
brew install git # Git repositories
git config --global user.name $name
git config --global user.email $email
git config --global credential.helper osxkeychain # Tell Git to use sxkeychain helper using the global credential.helper config

# Global gitignore files
echo "npm-debug.log" >> ~/.gitignore_global
echo ".DS_Store" >> ~/.gitignore_global
echo "*~" >> ~/.gitignore_global #vi
echo "tags" >> ~/.gitignore_global # ctags
git config --global core.excludesfile ~/.gitignore_global

# brew install wget # Install wget

brew install --cask google-chrome # Web browser
# brew install --cask skype # Communication software
# brew install --cask vlc # Video player
brew install --cask spotify # Music streaming
# brew install --cask dropbox # SkyDrive file manager

# brew install --cask dash # Gode documentation
brew install --cask iterm2 # A better terminal for Mac

# brew install --cask caffeine # Prevent mac from sleeping

# brew install --cask slack # Team communication

# brew install --cask kap # Screen recorder

# Setup vim rc file
# brew install --cask macvim # VIM Text editor for mac
# git clone https://github.com/LasseHaslev/ultimate-vimrc.git ~/.vim/runtime
# sh ~/.vim/runtime/install.sh
brew install --cask vimr # VIM Text editor for mac
git clone https://github.com/LasseHaslev/neovim-config.git ~/.config/nvim

# Install mac appstore CLI
brew install mas
# mas install 443987910 # 1Password (6.8.8)
mas install 419330170 # Moom (3.2.14)
mas install 403388562 # Transmit (4.4.13)
# mas install 404010395 # TextWrangler (5.5.2)

brew install --cask sequel-ace # Graphical SQL client

brew install npm # Package manager for javascript
brew install composer # Install composer

# Install PHP and Laravel valet
brew install php

# Install Laravel Valet
composer global require laravel/valet
valet install
# Install mysql
brew install mysql@5.7
brew services start mysql@5.7

# laravel installer "laravel new {project name}
composer global require "laravel/installer"

# install personal git-status
# npm install -g @lassehaslev/git-status

# A fun little detail when the script has been finished
say "It has been done"

# Setup "oh my zsh" last because it will cancel the process when its done
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
