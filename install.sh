#!/bin/bash

set -e

cd "$(dirname "${BASH_SOURCE}")";
pwd

git pull origin master;

function install() {
    rsync --exclude ".git/" \
            --exclude "install.sh" \
            -avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
else
    read -p "This will overwrite existing files in your home directory.  Are you sure? (y/n) " -n 1;
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install
    fi
fi

unset install
