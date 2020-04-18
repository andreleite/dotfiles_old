#!/bin/bash

set -e

git config --global user.email "andre@andre.io"
git config --global user.name "André Leite"
git config --global push.default simple

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME clone --bare git@github.com:andreleite/dotfiles.git $HOME/.dotfiles

function dot {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

dot checkout

dot config status.showUntrackedFiles no

BASH_CONFIG_FILE="$HOME/.profile"

INIT_COMMAND="source $HOME/.init"

grep -Fq "$INIT_COMMAND" $BASH_CONFIG_FILE || echo $INIT_COMMAND >> $BASH_CONFIG_FILE

