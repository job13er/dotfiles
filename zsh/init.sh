#! /bin/sh

#
# Courtesy of https://oliverspryn.blog/adding-git-completion-to-zsh-60f3b0e7ffbc
#

# Create initial .zsh/ dir
ZDIR=~/.zsh
mkdir -p $ZDIR

# Add git completion
cd $ZDIR
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Add spaceship-prompt
brew install spaceship

ENV=~/.zsh/env.zsh
echo '#' >> $ENV
echo '# Machine-specific environment variables go here' >> $ENV
echo '#' >> $ENV
echo 'export NPM_TOKEN=""' >> $ENV

VNODE_COMP=$ZDIR/_vnode
echo '#compdef vnode' > $VNODE_COMP
echo '' > $VNODE_COMP
echo '_vnode() {' > $VNODE_COMP
echo '  _files -/ -W ${NODE_ENV_DIR}' > $VNODE_COMP
echo '}' > $VNODE_COMP
echo '' > $VNODE_COMP
echo '_vnode' > $VNODE_COMP

CONF=~/.zsh/configs.zsh
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

RC=~/.zshrc
echo '# Load Git completion (and my custom configs)' >> $RC
echo "zstyle ':completion:*:*:git:*' script ~/$ZDIR/git-completion.bash" >> $RC
echo "fpath=($ZDIR $$fpath)" >> $RC
echo '' >> $RC
echo 'autoload -Uz compinit && compinit' >> $RC
echo '' >> $RC
echo "source $ZDIR/env.zsh" >> $RC
echo "source $ZDIR/configs.zsh" >> $RC
echo '' >> $RC
echo 'source $(brew --prefix)/opt/spaceship/spaceship.zsh' >> $RC

echo "source $RC" >> ~/.zprofile
