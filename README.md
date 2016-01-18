# dotfiles

Another dotfiles repository, except for, this one is mine! I would strongly suggest that you review and understand all settings, options, and configurations used before blindly using any of this.

The following is not only for informational purposes, but also the order in which I would execute commands when provisioning a new Mac.

## Installation

The bootstrapper script will handle copying the proper content of this repository to your home folder.

```sh
git clone https://github.com/jadametz/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update things later on:

```sh
source bootstrap.sh
```

## Install Homebrew formulae

```sh
./brew.sh
```

## OS X defaults

For use when setting up a new Mac

```sh
./.osx
```

## Thanks to...

[Mathias Bynens](https://mathiasbynens.be/) and all of the work him and his contributor's have done on his [dotfiles](https://github.com/mathiasbynens/dotfiles) repository. I learned a ton putting my own repository together while pulling a majority of information from him.