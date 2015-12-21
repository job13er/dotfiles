
# Add local bin to PATH
PATH=~/.dotfiles/bin:$PATH
export PATH

# use VIM for EDITOR
export EDITOR=vim

export HTML_TABS=2
export JSON_TABS=2
export JS_TABS=2
export MAX_WIDTH=120
export MAX_PY_WIDTH=$MAX_WIDTH
export MAX_JS_WIDTH=$MAX_WIDTH

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias cl='clear'

#
# Handy grep functions
#
SOURCE="${BASH_SOURCE[0]}"
# resolve $SOURCE until the file is no longer a symlink
while [ -h "$SOURCE" ]; do
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, resolve it
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd "$( dirname "${SOURCE}" )" && pwd )"

source ${DIR}/.bashrc_grep

# make everything prompt
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias rm='/bin/rm -i'

# easy ways to log out
alias bye='exit'

# super helpful shortcut to execute previous command
alias r='fc -s'

#
# Color options
#
c_reset='\[\e[0m\]'
c_black='\[\e[0;30m\]'
c_dark_grey='\[\e[1;30m\]'
c_blue='\[\e[0;34m\]'
c_light_blue='\[\e[1;34m\]'
c_green='\[\e[0;32m\]'
c_light_green='\[\e[1;32m\]'
c_cyan='\[\e[0;36m\]'
c_light_cyan='\[\e[1;36m\]'
c_red='\[\e[0;31m\]'
c_light_red='\[\e[1;31m\]'
c_purple='\[\e[0;35m\]'
c_light_purple='\[\e[1;35m\]'
c_brown='\[\e[0;33m\]'
c_yellow='\[\e[1;33m\]'
c_light_grey='\[\e[0;37m\]'
c_white='\[\e[1;37m\]'

# Source all the other core .bashrc files from my dotfiles
source ${DIR}/.bashrc_git
source ${DIR}/.bashrc_virtualenv
source ${DIR}/.bashrc_nodeenv
source ${DIR}/.bashrc_prompt # must be below _git _virtualenv and _nodeenv as they provide prompt functions
