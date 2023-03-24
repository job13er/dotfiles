# auto-complete function for allowing tab-completion for projects
_go_to_complete () {
    local cur=${COMP_WORDS[COMP_CWORD]}
    if [ ${COMP_CWORD} == 2 ]
    then
        local prev=${COMP_WORDS[1]}
        COMPREPLY=( $(compgen -W "`/bin/ls ${REPO_ROOT}/Private/$prev`" -- $cur) )
    else
        COMPREPLY=( $(compgen -W "`/bin/ls ${REPO_ROOT}/Private`" -- $cur) )
    fi
}

# auto-complete function for allowing tab-completion for projects
_go_to_public_complete () {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "`/bin/ls ${REPO_ROOT}/Public`" -- $cur) )
}

complete -F _go_to_complete go_to
complete -F _go_to_complete g
complete -F _go_to_public_complete go_to_public
complete -F _go_to_public_complete gp
