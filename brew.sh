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
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
brew install docker
brew install kubectx

# Golang
brew install golang

# Python
brew install python3

# Ruby
brew install rbenv

# Install via Homebrew Cask
brew install --casks \
	1password \
	1password-cli \
	# alfred \
	authy \
	daisydisk \
	discord \
	divvy \
	dropbox \
	google-cloud-sdk \
	istat-menus \
	iterm2 \
	java \
	notion \
	postman \
	sequel-pro \
	# slack \
	soulver \
	spotify \
	sublime-text \
	textexpander5 \
	vagrant \
	virtualbox \
	visual-studio-code \

# Remove outdated versions from the cellar.
brew cleanup
