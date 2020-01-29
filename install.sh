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
echo "Add repositories....................."
sudo add-apt-repository ppa:mmstick76/alacritty

echo "Installing update...................."
sudo apt-get update
echo ""
echo "Installing upgrade..................."
sudo apt-get -y upgrade
echo ""
echo "====================================="
echo "===== Install Necessary program ====="
echo "====================================="
sudo apt-get -y install git-core curl build-essential alacritty
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
echo "installing Plugin Manager........."
mkdir -p ~/.config/nvim
sudo apt-get install neovim python3 python3-pip git curl exuberant-ctags -y

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'll be using Iosevka for Powerline)
curl -fLo ~/.fonts/Iosevka\ Term\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Term%20Nerd%20Font%20Complete.ttf

echo ""
echo "Copy config file .................."
cd
mkdir tmp
cd tmp/my-linux
cp ./config/.zshrc ~/
cp ./config/.tmux.conf ~/
cp -r config/.zsh ~/
cp ./config/.alacritty.yml ~/.config/alacrity/alacrity.yml
tmux source-file ~/.tmux.conf
echo ""
echo "Make ZSH default..................."
sh -s $(which zsh)


echo "Installing powerline font............"
cd
cd tmp
git clone https://github.com/powerline/fonts.git
cd fonts && sudo ./install.sh
cd
