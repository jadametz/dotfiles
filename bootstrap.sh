#!/usr/bin/env bash
# Heavily inspired by mathiasbynens/dotfiles/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function bootstrap() {
	rsync --exclude ".git/" \
			--exclude ".DS_Store" \
			--exclude "bootstrap.sh" \
			--exclude "brew.sh" \
			--exclude "new-machine.sh" \
			--exclude "README.md" \
			--exclude "LICENSE" \
			-avh --no-perms . ~;

	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	bootstrap;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $RESPONSE =~ &[Yy]$ ]]; then
		bootstrap;
	fi;
fi;

unset bootstrap;