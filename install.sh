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
brew tap caskroom/cask
brew install caskroom/cask/brew-cask

# Install git first because cask needs git
brew install git # Git repositories
brew install npm # Package manager for javascript

brew install wget # Install wget
brew install tree # quickly view folder structure in terminal

brew cask install google-chrome # Web browser
brew cask install franz # Social messenger software
brew cask install skype # Communication software
brew cask install reeder # News reader
brew cask install vlc # Video player
brew cask install spotify # Music streaming
brew cask install dropbox # SkyDrive file manager

brew cask install dash # Gode documentation
brew cask install iterm2 # A better terminal for Mac
brew cask install alfred # A better terminal for Mac
brew cask install caffeine # Prevent mac from sleeping

brew cask install vagrant # Virtual mashine
brew cask install virtualbox # Prevent mac from sleeping

brew cask install slack # Team communication
brew cask install 1password # Password manager

brew cask install mindnode-pro # Mind mapping software
brew cask install macvim # VIM Text editor for mac
brew cask install moom # Mac window organization

brew cask install transmit # FTP client

brew cask install sequel-pro # Graphical SQL client
brew cask install livereload # Reloads browser when you change your files developing web apps
brew cask install rescuetime # Monitor your activities
brew cask install graphviz # Write graphs in dot
brew cask install textwrangler # Texteditor with GREP posibilities
brew cask install nylas-n1 # Mail client

brew cask install seil # Keymapper for mac

brew cask install flux # it makes the color of your computer's display adapt to the time of day, warm at night and like sunlight during the day

brew cask install fluid # Turn Your Favorite Web Apps into Real Mac Apps.

# Setup vim rc file
git clone -b personal https://github.com/LasseHaslev/ultimate-vimrc.git ~/.vim/runtime
sh ~/.vim/runtime/install.sh

# Install npm Dependencies
npm install --global gulp-cli # Javascript task manager
brew install ctags # Brows like a pro with ctags
brew install the_silver_searcher # Searching with ag

# Setup git
git config --global user.name $name
git config --global user.email $email
git config --global credential.helper osxkeychain # Tell Git to use sxkeychain helper using the global credential.helper config

# Add homestead
vagrant box add laravel/homestead
cd ~
git clone https://github.com/laravel/homestead.git Homestead
cd ~/Homestead
bash ./init.sh
cd ~

# A fun little detail when the script has been finished
say -v whisper "It has been done"

# Setup "oh my zsh" last because it will cancel the process when its done
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
