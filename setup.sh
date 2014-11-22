#!/bin/sh

if ! brew_loc="$(type -p brew)" || [ -z "$brew_loc" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -d "/Library/Caches/Homebrew/brew-cask--git/" ]; then
  brew install caskroom/cask/brew-cask
fi  

if [ ! -d "/Users/youchan/.rbenv" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  eval "$(~/.rbenv/bin/rbenv init -)"
fi

if [ ! -d "/Library/Caches/Homebrew/brew-bundle--git" ]; then
  brew tap matsu-chara/brew-bundle
  brew install brew-bundle
fi

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

cd casks; make

cd "$HOME"; ln -s dotfile/_vimrc ~/.vimrc
