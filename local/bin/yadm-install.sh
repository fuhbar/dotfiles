#!/bin/sh

# This is just a list of commands need to be ran in order to complete the
# dotfiles setup and related components. 

cd ~/local/etc
brew bundle install

pip -r requirements.txt
pip3 -r requirements-python3.txt

$HOME/local/src/fzf/install

if [ $HOME/.oh-my-zsh ];
  mkdir -vp $HOME/.oh-my-zsh/custom/themes
  ln -vfs $HOME/local/src/powerlevel9k $HOME/.oh-my-zsh/custom/themes/powerlevel9k
fi

ln -svf $HOME/.vimrc $HOME/.config/nvim/init.vim

mkdir -vp $HOME/.local/share/nvim/site/autoload/
ln -vfs $HOME/local/src/vim-plug/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim

mkdir -vp $HOME/.vim/autoload/
ln -vfs $HOME/local/src/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
