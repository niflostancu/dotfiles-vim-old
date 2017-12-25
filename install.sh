#!/bin/bash
# Zsh dotfiles installation script

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIM_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nvim/"

if [[ -f "$ZDOTDIR/.zshrc" ]]; then
  echo "A nvim configuration already exists in $VIM_CONFIG!"
  read -p "Are you sure you want to replace it? " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

echo "Installing vim config to '$VIM_CONFIG'"
mkdir -p "$VIM_CONFIG"

echo "source $SRC_DIR/init.vim" > "$VIM_CONFIG/init.vim"

echo "Done!"


