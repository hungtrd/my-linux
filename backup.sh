#!/usr/bin/env bash
# backup.sh - Backup script for the $HOME/.config/ directory (macOS & Linux)

cd "$(dirname "$0")" || exit 1

# backup <source> [dest]: copy a file or directory, skip what doesn't exist on this machine
backup() {
  if [ -e "$1" ]; then
    cp -R "$1" "${2:-./dotfiles}"
  else
    echo "  skip (not found): $1"
  fi
}

echo "Backing up dotfiles..."

# skip neovim for now
# backup $HOME/.config/nvim
backup $HOME/.config/alacritty
backup $HOME/.config/i3
backup $HOME/.config/i3status
backup $HOME/.config/rofi
backup $HOME/.config/fish
backup $HOME/.config/picom
backup $HOME/.config/neofetch
backup $HOME/.config/betterlockscreen
backup $HOME/.config/kitty
backup $HOME/.config/aerospace
backup $HOME/.config/git
backup $HOME/.config/tmux
backup $HOME/.gitconfig

# Claude Code statusline (feeds usage to tmux) + only the statusLine key of settings.json
mkdir -p ./dotfiles/claude
backup $HOME/.claude/statusline.sh ./dotfiles/claude/
if [ -f $HOME/.claude/settings.json ] && command -v jq >/dev/null; then
  jq '{statusLine}' $HOME/.claude/settings.json > ./dotfiles/claude/settings.statusLine.json
fi
echo "Backup complete!"

echo "..............................................."
echo "Commit and push to Github? (yes/no)"
read choice

if [[ $choice == "yes" ]]; then
  echo "Pushing to GitHub..."

  commit_message="Update dotfiles: $(date)"
  git add .
  git commit -m "$commit_message"
  git push origin master

  echo "Push complete!"
else
  echo "Backup without commit!"
fi
