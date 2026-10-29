#!/bin/bash
# Install tools
# Command line tools
# alacritty neovim fish oh-my-fish tmux packer peco starship dmenu
# UI tools
# rofi picom ibus-bamboo feh flameshot betterlockscreen
# LSP
# gopls rust-analyzer pyright golangci-lint typescript-language-server

# Copy Config
cp -r ./dotfiles/nvim $HOME/.config
cp -r ./dotfiles/alacritty $HOME/.config
cp -r ./dotfiles/i3 $HOME/.config
cp -r ./dotfiles/i3status $HOME/.config
cp -r ./dotfiles/rofi $HOME/.config
cp -r ./dotfiles/fish $HOME/.config
cp -r ./dotfiles/picom $HOME/.config
cp -r ./dotfiles/aerospace $HOME/.config
cp -r ./dotfiles/tmux $HOME/.config
cp ./dotfiles/.gitconfig $HOME/.gitconfig

# Claude Code statusline: copy script, merge statusLine key into settings.json (needs jq)
mkdir -p $HOME/.claude
cp ./dotfiles/claude/statusline.sh $HOME/.claude/
settings=$HOME/.claude/settings.json
[ -f $settings ] || echo '{}' > $settings
jq -s '.[0] * .[1]' $settings ./dotfiles/claude/settings.statusLine.json > $settings.tmp && mv $settings.tmp $settings

if [ "$(uname)" = "Darwin" ]; then
  cp -r ./fonts/* ~/Library/Fonts/
else
  cp -r ./fonts/* /usr/share/fonts/
fi
cp -r ./wallpapers/* ~/Pictures/
