# dotfiles

Another dotfiles repository, except for, this one is mine! I would strongly suggest that you review and understand all settings, options, and configurations used before blindly using any of this.

The following is not only for informational purposes, but also the order in which I would execute commands when provisioning a new Mac.

## Installation

Especially when provisioning a new Mac, start out by making sure the developer tools are installed.

```sh
xcode-select --install
```

The bootstrap script will handle copying the proper content of this repository to your home folder.

```sh
mkdir ~/projects && cd ~/projects
git clone https://github.com/jadametz/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update things later on:

```sh
source bootstrap.sh
```

## Install Homebrew formulae

During a fresh Mac provisioning we'll tack on the `-f` flag so we install Homebrew + the formulae.

```sh
./brew.sh -f
```

## OS X defaults

For use when setting up a new Mac

```sh
./.osx
```

## App Store

Some additional apps that I don't install with Homebrew

* [Alfred](https://www.alfredapp.com/)
* [Clear](https://itunes.apple.com/us/app/clear-tasks-reminders-to-do/id504544917?mt=12)
* [DaisyDisk](https://itunes.apple.com/us/app/daisydisk/id411643860?mt=12)
* [Divvy](https://itunes.apple.com/us/app/divvy-window-manager/id413857545?mt=12)
* [Fantastical 2](https://itunes.apple.com/us/app/fantastical-2-calendar-reminders/id975937182?mt=12)
* [Pocket](https://itunes.apple.com/us/app/pocket/id568494494?mt=12)
* [Soulver](https://itunes.apple.com/us/app/soulver/id413965349?mt=12)

## Thanks to...

[Mathias Bynens](https://mathiasbynens.be/) and all of the work him and his contributor's have done on his [dotfiles](https://github.com/mathiasbynens/dotfiles) repository. I learned a ton putting my own repository together while pulling a majority of information from him.