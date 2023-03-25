#
# Helpers to simplify running unit tests on components
#

function test_component() {
    full_path=$1
    shift
    rest=$*
    filename=$full_path:t
    dir=$full_path:h
    component=""
    if [[ "$filename" == "index.mjs" ]]
    then
        component=$dir:t
    else
        component="${filename%.*}"
    fi
    test_file="${dir}/tests/${component}.test.mjs"


    echo jest --watch --coverage --collectCoverageFrom $full_path $rest $test_file
    jest --watch --coverage --collectCoverageFrom $full_path $rest $test_file
}

alias tcomp="test_component"
