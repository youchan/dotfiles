if [ ! -d "$HOME/.rbenv" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
  eval "$(~/.rbenv/bin/rbenv init -)"
fi

apt install -y build-essential
apt install -y libssl-dev zlib1g-dev
apt install -y zsh vim-gtk3 neovim tmux snapd
apt install -y fortune fortunes
apt install -y fd-find fzf ripgrep zoxide 7zip
