# Directory where you'd like to store your node virtual environments
export NODE_ENV_DIR=~/.node-envs

function vnode () {
    if [ -d ${NODE_ENV_DIR}/$1 ]
    then
        . ${NODE_ENV_DIR}/$1/bin/activate
    else
        nodeenv --node $1 --prebuilt ${NODE_ENV_DIR}/$1
        . ${NODE_ENV_DIR}/$1/bin/activate
    fi
}
