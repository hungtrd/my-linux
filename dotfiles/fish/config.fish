
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
if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
    alias ls "exa --icons"
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
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

set -x PATH "$HOME/.rbenv/bin:$PATH"
status --is-interactive; and rbenv init - fish | source
set -x PATH "$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# shell prompt
starship init fish | source

# Set env for project
#set -x SECRET_PEPPER cDNzNnY5eSRCJkUpSEBNY1FlVGhXbVpxNHQ3dyF6JUM= #p3s6v9y$B&E)H@McQeThWmZq4t7w!z%C
#set -x TEST_FLG true
#set -x DOCS_BUCKET_NAME clean-docs-dev
#set -x GOOGLE_APPLICATION_CREDENTIALS /home/hungtd/workspace/company/trial-pay/fir-project-a5e1e-5db6737b7fb2.json
#set -x JWT_SECRET_KEY thisisprivatekey
#set -x BIGQUERY_POINT_DATASET dev_point

#set env shinonome
set -x SHINONOME_ENV local
set -x DB_HOST localhost
set -x DB_PORT 5432
set -x DB_PASSWORD password
set -x DB_NAME dev_shinonome
set -x DB_USER postgres

set -x BROKER_URL broker.hivemq.com:8883
set -x MQTT_CLIENT_ID shinonome-api
set -x MQTT_USERNAME shinononme
set -x MQTT_PASSWORD password
set -x CONTENT_DOWNLOAD_URL https://dev-content.saiun.retail-ai.jp

set -x OPENAI_API_KEY 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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH /home/hungtd/.cargo/bin $PATH
