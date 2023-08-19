export CLICOLOR=1

#
# Pretty ls colors, thanks to https://geoff.greer.fm/lscolors/
#
export LSCOLORS="GxFxCxDxBxegedabagaced"
export LS_COLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias ls='ls -F'
alias ll='ls -al'
