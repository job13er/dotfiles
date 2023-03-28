#
# Utilities for adding/removing paths from PATH
# taken from http://stackoverflow.com/q/370047
#
function path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
function path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
function path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

# Directory where you store your repositories
REPO_ROOT=${REPO_ROOT:-~/Documents/Repos}

#
# Remove all exising repo directories from PATH
#
function remove_repos () {
    for dir in "$path"; do
        if [[ "$dir" = ${REPO_ROOT}* ]]
        then
            path_remove $dir
        fi
    done
}

# Use an alias instead of the function directly so that PATH is updated in callers context
alias g="go_to"
alias gp="go_to_public"

#
# Move into a repository and add its local node_modules/.bin to path
#
function go_to () {
    remove_repos
    if [ $# -eq 2 ]
    then
        path_prepend ${REPO_ROOT}/Private/$1/$2/node_modules/.bin
        cd ${REPO_ROOT}/Private/$1/$2
    else
        path_prepend ${REPO_ROOT}/Private/$1/node_modules/.bin
        cd ${REPO_ROOT}/Private/$1
    fi
    if [ -e "env/bin/activate" ]
    then
        source env/bin/activate
    fi
}

#
# Move into a repository and add its local node_modules/.bin to path
#
function go_to_public () {
    remove_repos
    path_prepend ${REPO_ROOT}/Public/$1/node_modules/.bin
    cd ${REPO_ROOT}/Public/$1
    if [ -e "env/bin/activate" ]
    then
        export JSON_TABS=4 # use four-space tabbing in JSON files in a python project
        source env/bin/activate
    fi
}

path_append ~/.dotfiles/bin

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.dotfiles/bashrc/repos.bash
