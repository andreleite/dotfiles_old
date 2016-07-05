#!/bin/bash

rm -rf $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME clone --bare https://github.com/andreleite/dotfiles.git $HOME/.dotfiles

function dot {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p .dotfiles-backup

dot checkout

dot config status.showUntrackedFiles no

if [ -f "$HOME/.bash_profile" ]; then
  BASH_CONFIG_FILE="$HOME/.bash_profile"
elif [ -f "$HOME/.bashrc" ]; then
  BASH_CONFIG_FILE="$HOME/.bashrc"
fi

INIT_COMMAND="source $HOME/.init"

grep -Fq "$INIT_COMMAND" $BASH_CONFIG_FILE || echo $INIT_COMMAND >> $BASH_CONFIG_FILE
