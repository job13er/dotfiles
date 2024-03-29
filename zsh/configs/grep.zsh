#
# My handy grep functions
#

# recursive grep
function rgrep () {
    grep -ri --color "$*" .
}

# grep by filetype
function ftgrep () {
    grep -ri --color --include=*.$1 "${*:2}" .
}

function pygrep () {
    ftgrep py "$@"
}

function jsgrep () {
    ftgrep js "$@"
}

function htgrep () {
    ftgrep html "$@"
}
