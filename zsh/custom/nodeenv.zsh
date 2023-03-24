# Directory where you'd like to store your node virtual environments
NODE_ENV_DIR=~/.node-envs

function vnode () {
    if [ -d ${NODE_ENV_DIR}/$1 ]
    then
        . ${NODE_ENV_DIR}/$1/bin/activate
    else
        nodeenv --node $1 --prebuilt ${NODE_ENV_DIR}/$1
        . ${NODE_ENV_DIR}/$1/bin/activate
    fi
}

# auto-complete function for allowing tab-completion for already installed environments
# _vnode_complete() {
#     local cur=${COMP_WORDS[COMP_CWORD]}
#     COMPREPLY=( $(compgen -W "`/bin/ls ${NODE_ENV_DIR}`" -- $cur) )
# }
# complete -F _vnode_complete vnode
