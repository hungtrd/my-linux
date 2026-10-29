
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
alias g "git"

alias note "lazytodo"

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
set -U nvm_default_version v24.13.0

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

# java
set -x JAVA_HOME "/Applications/Android Studio.app/Contents/jbr/Contents/Home"
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/cmdline-tools/latest/bin $PATH


# shell prompt
starship init fish | source




# Added by Antigravity CLI installer
set -gx PATH "/Users/hungtran/.local/bin" $PATH
set -x GPG_TTY "$(tty)"
