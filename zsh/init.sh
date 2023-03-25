#! /bin/sh

#
# Courtesy of https://oliverspryn.blog/adding-git-completion-to-zsh-60f3b0e7ffbc
#

mkdir -p ~/.zsh
cd ~/.zsh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh


echo '# Load Git completion (and my custom configs)' >> ~/.zshrc
echo "zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash" >> ~/.zshrc
echo 'fpath=(~/.zsh $fpath)' >> ~/.zshrc
echo "" >> ~/.zshrc
echo 'autoload -Uz compinit && compinit' >> ~/.zshrc

