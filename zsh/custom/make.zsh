#
# Make target completion (fom https://stackoverflow.com/a/59854921)
#
#
zstyle ':completion:*:*:make:*' tag-order 'targets'

autoload -U compinit && compinit
