if [ ! -d "$HOME/.rbenv" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
  eval "$(~/.rbenv/bin/rbenv init -)"
fi

yum install -y openssl-devel readline-devel zlib-devel
yum -y install zsh
yum -y install epel-release
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
yum -y install neovim
