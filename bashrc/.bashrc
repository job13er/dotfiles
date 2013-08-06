
# Add local bin to PATH
PATH=~/.dotfiles/bin:$PATH
export PATH

# use VIM for EDITOR
export EDITOR=vim

export HTML_TABS=2
export MAX_WIDTH=79

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# shortcut to calculate python coverage
function pycov() { python-coverage run "$@"; python-coverage report --show-missing; }

# Open up keepassx
alias openkp='keepassx ~/Dropbox/KP/Database.kdb &'

# Aliases
alias cl='clear'

# make everything prompt
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias rm='/bin/rm -i'

# easy ways to log out
alias bye='exit'

# super helpful shortcut to execute previous command
alias r='fc -s'

