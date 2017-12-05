#!/bin/sh

if ! brew_loc="$(type -p brew)" || [ -z "$brew_loc" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -d "/Library/Caches/Homebrew/brew-cask--git/" ]; then
  brew install caskroom/cask/brew-cask
fi  

if [ ! -d "/Users/youchan/.rbenv" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
  eval "$(~/.rbenv/bin/rbenv init -)"
fi

if [ ! -d "/Library/Caches/Homebrew/brew-bundle--git" ]; then
  brew tap matsu-chara/brew-bundle
  brew install brew-bundle
fi

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

cd casks; make

cd $HOME/dotfiles; cp my.cnf /usr/local/etc/my.cnf

sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /bin/zsh

cd "$HOME"; ln -s dotfiles/_vimrc .vimrc
cd "$HOME"; ln -s dotfiles/_eskk .eskk
cd "$HOME"; ln -s dotfiles/_zshenv .zshenv
cd "$HOME"; ln -s dotfiles/_zshrc .zshrc
cd "$HOME"; ln -s dotfiles/_aliases .aliases
cd "$HOME"; ln -s dotfiles/_hash .hash
cd "$HOME"; ln -s dotfiles/_gitconfig .gitconfig
cd "$HOME"; ln -s dotfiles/_gitignore .gitignore
