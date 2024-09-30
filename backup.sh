#!/bin/bash
# backup.sh - Backup script for the $HOME/.config/ directory

echo "Backing up dotfiles..."

# skip neovim for now
# cp -r $HOME/.config/nvim ./dotfiles
cp -r $HOME/.config/alacritty ./dotfiles
cp -r $HOME/.config/i3 ./dotfiles
cp -r $HOME/.config/i3status ./dotfiles
cp -r $HOME/.config/rofi ./dotfiles
cp -r $HOME/.config/fish ./dotfiles
cp -r $HOME/.config/picom ./dotfiles
cp -r $HOME/.config/neofetch ./dotfiles
cp -r $HOME/.config/betterlockscreen ./dotfiles
cp -r $HOME/.config/kitty ./dotfiles
cp $HOME/.tmux.conf ./dotfiles
cp $HOME/.gitconfig ./dotfiles
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
elif [[ $choice == "no" ]]; then
  echo "Backup without commit!"
else
  echo "Backup without commit!"
fi
