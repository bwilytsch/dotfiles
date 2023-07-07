#!/bin/bash

# Assumes you have installed Homebrew

# Install XCode and command-line tools
xcode-select --install

# Make sure we're using the latest Homebrew
brew update
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew instlal moreutils
brew install findutils
brew install gnu-sed

# ZSH
brew install zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install wget with IRI support
brew install wget 

# Install more recent versions of some OS X tools
brew install vim
brew install ripgrep

# Install kitty, a GPU-based terminal emulator
brew install --cask kitty

# Neovim setup
brew install neovim
brew install stow
brew install tmux
brew install lazygit

# Install other useful binaries
brew install node
brew install git
brew install ffmpeg
brew install rename
brew install svgo

# Remove outdated versions from the cellar
brew cleanup

npm install -g prettier
npm install -g ngrok
npm install -g typescript
npm install -g javascript-typescript-langserver # Not sure about this one
