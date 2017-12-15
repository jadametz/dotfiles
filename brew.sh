#!/usr/bin/env bash

# Install command-line tools & applications using Homebrew.
# Heavily inspired by mathiasbynens/dotfiles/brew.sh

# CLI Options // Usage
if [ "#1" = "-h" ] || [ "$1" = "--help" ] ; then
	echo "Usage: brew.sh (-i)"
	echo "Formulae install: brew.sh"
	echo "Homebrew + formulae install: brew.sh -i"

	exit 0
fi

# Install Homebrew.
if [ "$1" = "-i" ] ; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we're using the latest Homebrew.
brew update

# Upgrade all already-installed formulae.
brew upgrade --all

# Alternative versions of Casks
brew tap caskroom/versions

# Install updated GNU core utilities and add to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

brew install bash-completion@2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Homebrew extension Cask
brew install caskroom/cask/brew-cask

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep
brew install openssh
brew install screen
brew tap homebrew/homebrew-php

# Install encryption stuff
brew install pwgen
brew install gpg
brew install gpg-agent

# Install other useful things
brew install ack
brew install awscli
brew install git
brew install hub
brew install speedtest_cli
brew install ssh-copy-id
brew install terraform
brew install tldr
brew install tree

brew tap caskroom/fonts
brew cask install font-fira-code

# Docker / Kubernetes
brew cask install docker-edge
brew install kubectx --with-short-names

# Golang
brew install golang

# Python
brew install python
brew install python3

# Ruby
brew install rbenv
rbenv install 2.4.2
rbenv global 2.4.2
rbenv rehash

# Install via Homebrew Cask
brew cask install 1password
brew cask install alfred
brew cask install atom
brew cask install authy
brew cask install caffeine
brew cask install cloud
brew cask install daisydisk
brew cask install divvy
brew cask install dropbox
brew cask install flux
brew cask install google-chrome
brew cask install google-cloud-sdk
brew cask install istat-menus
brew cask install iterm2
brew cask install java
brew cask install postman
brew cask install sequel-pro
brew cask install skitch
brew cask install slack
brew cask install soulver
brew cask install spotify
brew cask install sublime-text
brew cask install textexpander5
brew cask install vagrant
brew cask install virtualbox
brew cask install visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup
