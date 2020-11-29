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

### Adding custom commands

If `~/.extra` exists, it will be sourced along with the other files. For example, the following content is in my `~/.extra` so that my GitHub username is not source controlled as part of this repository.

```shell
GIT_AUTHOR_NAME="Jesse Adametz"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="jesseadametz@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

### Install Homebrew formulae

During a fresh Mac provisioning we'll tack on the `-i` flag so we install Homebrew + the formulae.

```sh
./brew.sh -i
```

## Thanks

[Mathias Bynens](https://mathiasbynens.be/) and all of the work him and his contributor's have done on his [dotfiles](https://github.com/mathiasbynens/dotfiles) repository. I learned a ton putting my own repository together while pulling a majority of information from him.
