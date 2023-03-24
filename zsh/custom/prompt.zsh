# Custom prompt functions

function arch_prompt () {
    echo "[$(arch)] "
}

function git_branch_prompt () {
    GIT_DIR=`git rev-parse --git-dir 2>/dev/null`
    if [ -z "$GIT_DIR" ]; then
        return 0
    fi
    GIT_HEAD=`cat $GIT_DIR/HEAD`
    GIT_BRANCH=${GIT_HEAD##*/}
    if [ ${#GIT_BRANCH} -eq 40 ]; then
        GIT_BRANCH="(no branch)"
    fi
    STATUS=`git status --porcelain`
    if [ -z "$STATUS" ]; then
        git_color="${c_git_clean}"
    else
        echo -e "$STATUS" | grep -q '^ [A-Z\?]'
        if [ $? -eq 0 ]; then
            git_color="${c_git_unstaged}"
        else
            git_color="${c_git_staged}"
        fi
    fi
    echo "(${git_color}$GIT_BRANCH${c_reset})"
}

function nodeenv_prompt () {
    if [ ! -z "$NODE_VIRTUAL_ENV" ]
    then
        echo "(${c_purple}`basename $NODE_VIRTUAL_ENV`${c_reset}) "
    else
        echo ""
    fi
}

# Prompt function for displaying the virtualenv you're in
function venv_prompt () {
    if [ ! -z "$VIRTUAL_ENV" ]
    then
        echo "(${c_yellow}`basename $VIRTUAL_ENV`${c_reset}) "
    else
        echo ""
    fi
}

