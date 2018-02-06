#!/bin/sh

chsh -s /bin/zsh

cd "$HOME"; mkdir .config && cd .config; ln -s ../dotfiles/_config/nvim

cd "$HOME"; ln -s dotfiles/_vimrc .vimrc
cd "$HOME"; ln -s dotfiles/_eskk .eskk
cd "$HOME"; ln -s dotfiles/_zshenv .zshenv
cd "$HOME"; ln -s dotfiles/_zshrc .zshrc
cd "$HOME"; ln -s dotfiles/_aliases .aliases
cd "$HOME"; ln -s dotfiles/_hash .hash
cd "$HOME"; ln -s dotfiles/_gitconfig .gitconfig
cd "$HOME"; ln -s dotfiles/_gitignore .gitignore
