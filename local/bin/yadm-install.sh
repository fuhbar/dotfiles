#!/bin/sh

# This is just a list of commands need to be ran in order to complete the
# dotfiles setup and related components. 

cd ~/local/etc
brew bundle install

pip -r requirements.txt

$HOME/local/src/fzf/install

if [ $HOME/.oh-my-zsh ];
  mkdir -p $HOME/.oh-my-zsh/custom/themes
  ln -fs $HOME/local/src/powerlevel9k $HOME/.oh-my-zsh/custom/themes/powerlevel9k
fi
