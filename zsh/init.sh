# Create initial .zsh/ dir
ZDIR=~/.zsh
ZDIR_STR='~/.zsh'
mkdir -p $ZDIR

# Add git completion
curl -o $ZDIR/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o $ZDIR/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Add spaceship-prompt
brew install spaceship

ENV=$ZDIR/env.zsh
echo '#' >> $ENV
echo '# Machine-specific environment variables go here' >> $ENV
echo '#' >> $ENV
echo 'export NPM_TOKEN=""' >> $ENV

CONF=$ZDIR/configs.zsh
echo '#' >> $CONF
echo '# Common configs from dotfiles' >> $CONF
echo '#' >> $CONF
echo 'CONFIGS=~/.dotfiles/zsh/configs' >> $CONF
echo '' >> $CONF
echo 'files=(aliases grep ls make nodeenv python react repos vim)' >> $CONF
echo '' >> $CONF
echo 'for file in $files' >> $CONF
echo 'do' >> $CONF
echo '  source ${CONFIGS}/${file}.zsh' >> $CONF
echo 'done' >> $CONF

VNODE_COMP=$ZDIR/_vnode
echo '#compdef vnode' > $VNODE_COMP
echo '' > $VNODE_COMP
echo '_vnode() {' > $VNODE_COMP
echo '  _files -/ -W ${NODE_ENV_DIR}' > $VNODE_COMP
echo '}' > $VNODE_COMP
echo '' > $VNODE_COMP
echo '_vnode' > $VNODE_COMP

RC=~/.zshrc
RC_STR='~/.zshrc'
echo '# Load Git completion (and my custom configs)' >> $RC
echo "zstyle ':completion:*:*:git:*' script ~/$ZDIR_STR/git-completion.bash" >> $RC
echo "fpath=($ZDIR_STR \$fpath)" >> $RC
echo '' >> $RC
echo 'autoload -Uz compinit && compinit' >> $RC
echo '' >> $RC
echo "source $ZDIR_STR/env.zsh" >> $RC
echo "source $ZDIR_STR/configs.zsh" >> $RC
echo '' >> $RC
echo 'source $(brew --prefix)/opt/spaceship/spaceship.zsh' >> $RC

PROFILE=~/.zprofile
echo "source $RC_STR" >> $PROFILE

source $PROFILE
