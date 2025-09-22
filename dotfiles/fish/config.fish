
# __    __                       __                      __
#|  \  |  \                     |  \                    |  \
#| $$\ | $$  ______    ______  _| $$_    __    __   ____| $$ __    __
#| $$$\| $$ |      \  /      \|   $$ \  |  \  |  \ /      $$|  \  |  \
#| $$$$\ $$  \$$$$$$\|  $$$$$$\\$$$$$$  | $$  | $$|  $$$$$$$| $$  | $$
#| $$\$$ $$ /      $$| $$   \$$ | $$ __ | $$  | $$| $$  | $$| $$  | $$
#| $$ \$$$$|  $$$$$$$| $$       | $$|  \| $$__/ $$| $$__| $$| $$__/ $$
#| $$  \$$$ \$$    $$| $$        \$$  $$ \$$    $$ \$$    $$ \$$    $$
# \$$   \$$  \$$$$$$$ \$$         \$$$$   \$$$$$$   \$$$$$$$ _\$$$$$$$
#                                                           |  \__| $$
#                                                            \$$    $$
#                                                             \$$$$$$
#********************************************************************#
#*********************** FISH CONFIGURATION FILE ********************#
#*********************** Author: HungTran ***************************#
#********************************************************************#

# aliases
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
    alias ls "eza --icons"
end

alias cl clear
alias x exit

# Git alias
alias gst "git status"
alias gad "git add -A"
alias gcm "git commit -m"

alias vim nvim

function cs
    cd $argv
    ls
end


set -g theme_color_scheme nord

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Variables

# go
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

# ruby
set -x PATH "$HOME/.rbenv/bin:$PATH"
status --is-interactive; and rbenv init - fish | source
set -x PATH "$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# bun
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH

# rust
set -x PATH $HOME/.cargo/bin $PATH

# cursor
fish_add_path $HOME/.local/bin

# nodejs
set -x PATH $HOME/.npm-global/bin $PATH

# shell prompt
starship init fish | source


