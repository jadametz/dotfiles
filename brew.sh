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

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Alternative versions of Casks
brew tap caskroom/versions

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other usefull utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep
brew install openssh

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
	quitter \
	sequel-pro \
	# slack \
	soulver \
	spotify \
	sublime-text \
	textexpander5 \
	vagrant \
	virtualbox \
	visual-studio-code \
	zappy

# Remove outdated versions from the cellar.
brew cleanup
