#!/bin/sh

# This is just a list of commands need to be ran in order to complete the
# dotfiles setup and related components. 

cd ~/local/etc
brew bundle install

pip -r requirements.txt

$HOME/local/src/fzf/install
