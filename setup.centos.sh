#!/bin/sh

chsh -s /bin/zsh

if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi

cd "$HOME/.config"; ln -s ../dotfiles/_config/nvim

if [ ! -d "/Users/youchan/.rbenv" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
  eval "$(~/.rbenv/bin/rbenv init -)"
fi

if [ ! -d "$HOME/.config/nvim/pack/minpac/opt" ]; then
  git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac
fi

cd "$HOME"; ln -s dotfiles/_vimrc .vimrc
cd "$HOME"; ln -s dotfiles/_eskk .eskk
cd "$HOME"; ln -s dotfiles/_zshenv .zshenv
cd "$HOME"; ln -s dotfiles/_zshrc .zshrc
cd "$HOME"; ln -s dotfiles/_aliases .aliases
cd "$HOME"; ln -s dotfiles/_hash .hash
cd "$HOME"; ln -s dotfiles/_gitconfig .gitconfig
cd "$HOME"; ln -s dotfiles/_gitignore .gitignore
