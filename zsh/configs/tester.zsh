#
# Helpers to simplify running web tester tests
#
#

function get_module() {
    full_path=$1
    filename=$full_path:t
    dir=$full_path:h
    module="${filename%.*}"
    full_module="$(echo $dir | tr / .).${module}"
    echo $full_module
}

function test_browser() {
    browser=$1
    full_module=$(get_module $2)

    echo CARIUM_TESTER_DEFAULT_STOP=6 tester run --driver=${browser} --test=${full_module}
    CARIUM_TESTER_DEFAULT_STOP=6 tester run --driver=${browser} --test=${full_module}
}

function test_chrome() {
    test_browser chrome $1
}

function test_firefox() {
    test_browser firefox $1
}

alias tchrome="test_chrome"
alias tff="test_firefox"
