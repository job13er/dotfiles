# auto-complete function for allowing tab-completion for already installed environments
_vnode_complete() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "`/bin/ls ${NODE_ENV_DIR}`" -- $cur) )
}
complete -F _vnode_complete vnode
