#!/bin/bash
# Install tools
# Command line tools
# alacritty neovim fish oh-my-fish tmux packer peco starship dmenu
# UI tools
# rofi picom ibus-bamboo feh

# Copy Config
cp -r ./dotfiles/nvim $HOME/.config
cp -r ./dotfiles/alacritty $HOME/.config
cp -r ./dotfiles/i3 $HOME/.config
cp -r ./dotfiles/i3status $HOME/.config
cp -r ./dotfiles/rofi $HOME/.config
cp -r ./dotfiles/fish $HOME/.config
cp -r ./dotfiles/picom $HOME/.config
cp ./dotfiles/.tmux.conf $HOME/.tmux.conf
cp -r ./fonts/* /usr/share/fonts/
cp -r ./wallpapers/* ~/Pictures/
