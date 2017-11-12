#!/bin/bash

# Bash script set up ubuntu
# Author: Nguyen Chien
# Config
home_dir = "home" # .vimrc, .zshrc

# Start run
sudo echo ""; echo "Root Privilege Acquired"
echo ""
echo "====================================="
echo "============== Update ==============="
echo "====================================="
echo ""
echo "Installing update...................."
sudo apt-get update
echo ""
echo "Installing upgrade..................."
sudo apt-get -y upgrade
echo ""
echo "====================================="
echo "===== Install Necessary program ====="
echo "====================================="
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs preload
echo ""
echo "====================================="
echo "======== Install Ruby on Rails ======"
echo "====================================="
echo ""
echo "Installing Ruby (2.3.3).............."
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

rbenv install 2.3.3
rbenv global 2.3.3

echo ""
echo "Installing bundler..................."
gem install bundler
echo ""
echo "Installing Rails....................."
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 5.0.1
rbenv rehash
echo ""
echo "Installing MySQL....................."
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
echo ""
echo "Installing PostgreSQL................"
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install postgresql-common
sudo apt-get -y install postgresql-9.5 libpq-dev
echo ""
echo "====================================="
echo "=========== Install ZMQ ============="
echo "====================================="
echo ""
echo "Installing Libsodium................."
sudo apt-get -y install libtool pkg-config build-essential autoconf automake
sudo apt-get -y install libzmq-dev
git clone git://github.com/jedisct1/libsodium.git
cd libsodium
./autogen.sh
./configure && make check
sudo make install
sudo ldconfig
echo ""
echo "Installing ZMQ......................."
wget http://download.zeromq.org/zeromq-4.1.4.tar.gz
tar -xvf zeromq-4.1.4.tar.gz
cd zeromq-4.1.4
./autogen.sh
./configure && make check
sudo make install
sudo ldconfig
cd
echo ""
echo "====================================="
echo "============ Install ZSH ============"
echo "====================================="
sudo apt-get -y install zsh
echo "Installing Oh my ZSH................."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
yes | cp ${home}/.zshrc ~/.zshrc
echo "Installing powerline font............"
cd
mkdir tmp
cd tmp
git clone https://github.com/powerline/fonts.git
cd fonts && sudo ./install.sh
cd

