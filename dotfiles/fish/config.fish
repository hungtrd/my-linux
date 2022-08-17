
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

alias cl "clear"

# Git alias
alias gst "git status"
alias gad "git add -A"
alias gcm "git commit -m"

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

# shell prompt
starship init fish | source

# Set env for project
set -x PROJECT_ID liquid-gear-352607
set -x LASSI_ENV development
set -x DB_HOST localhost
set -x DB_PORT 5432
set -x DB_USER postgres
set -x DB_PASSWORD hungtran97
set -x DB_NAME lassi
set -x SECRET_PEPPER cDNzNnY5eSRCJkUpSEBNY1FlVGhXbVpxNHQ3dyF6JUM= #p3s6v9y$B&E)H@McQeThWmZq4t7w!z%C
set -x TEST_FLG true
set -x DOCS_BUCKET_NAME clean-docs-dev
set -x GOOGLE_APPLICATION_CREDENTIALS /home/hungtd/workspace/company/trial-pay/liquid-gear-352607-023f3d45fc8c.json
set -x JWT_SECRET_KEY thisisprivatekey
