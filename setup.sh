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

# herdr: point default_shell at this machine's fish (Homebrew path on macOS, /usr/bin on Linux)
mkdir -p $HOME/.config/herdr
herdr_config=$HOME/.config/herdr/config.toml
cp ./dotfiles/herdr/config.toml $herdr_config
if fish_path=$(command -v fish); then
  sed "s|^default_shell = .*|default_shell = \"$fish_path\"|" $herdr_config > $herdr_config.tmp && mv $herdr_config.tmp $herdr_config
fi

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
