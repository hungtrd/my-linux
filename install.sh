#!/bin/bash

# Bash script set up linux
# Author: Hung Tran

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
sudo apt-get -y install git-core curl build-essential
echo ""
echo "Installing MySQL....................."
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
echo ""
cd
echo ""
echo "====================================="
echo "============ Install ZSH ============"
echo "====================================="
sudo apt-get -y install zsh
echo "Installing Oh my ZSH................."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Installing plugins ZSH"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions



echo ""
echo "====================================="
echo "=========== Install Tmux ============"
echo "====================================="
echo ""
echo "Installing lib need for tmux"
sudo apt-get -y install libevent-dev
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install tmux
cd

echo ""
echo "====================================="
echo "============ Install Vim ============"
echo "====================================="
echo ""
sudo apt-get -y install vim neovim
echo "installing Vundle........."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo ""
echo "Copy config file .................."
cd
cd tmp/my-linux
cp ./config/.zshrc ~/
cp ./config/.tmux.conf ~/
cp -r config/.zsh ~/
tmux source-file ~/.tmux.conf
echo ""
echo "Make ZSH default..................."
sh -s $(which zsh)


echo "Installing powerline font............"
cd
mkdir tmp
cd tmp
git clone https://github.com/powerline/fonts.git
cd fonts && sudo ./install.sh
cd
