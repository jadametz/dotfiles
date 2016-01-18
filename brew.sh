#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Heavily inspired by mathiasbynens/dotfiles/brew.sh

# CLI Options // Usage
if [ "#1" = "-h" ] || [ "$1" = "--help" ] ; then
	echo "Usage: brew.sh (-f)"
	echo "Example formulae install: brew.sh"
	echo "Example Homebrew + formulae install: brew.sh -f"
	
	exit 0
fi

# Ask for admin password
sudo -v

# Keep alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew.
if [ "$1" = "-f" ] ; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we're using the latest Homebrew.
brew update

# Upgrade all already-installed formulae.
brew upgrade --all

# Install updated GNU core utilities and add to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Homebrew extension Cask
brew install caskroom/cask/brew-cask

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install other useful things
brew install ack
brew install git
brew install speedtest_cli
brew install ssh-copy-id
brew install tree

# Install via Homebrew Cask
brew cask install atom
brew cask install google-chrome
brew cask install iterm2
brew cask install spotify
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup