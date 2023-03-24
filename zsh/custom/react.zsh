#
# Helpers to simplify running unit tests on components
#

function test_component() {
    path=$1
    shift
    rest=$*
    filename=$(basename -- "$path")
    dir=$(dirname -- $path)
    component=""
    if [[ "$filename" == "index.mjs" ]]
    then
        component="$(basename -- "$dir")"
    else
        component="${filename%.*}"
    fi
    test_file="${dir}/tests/${component}.test.mjs"


    echo jest --watch --coverage --collectCoverageFrom $path $rest $test_file
    jest --watch --coverage --collectCoverageFrom $path $rest $test_file
}

alias tcomp="test_component"
