" javascript specific rules

setlocal expandtab
setlocal commentstring=\ #\ %s

let max_width=$MAX_JS_WIDTH
execute "set cc=".max_width

let tab_width=$JS_TABS
execute "set tabstop=".tab_width
execute "set softtabstop=".tab_width
execute "set shiftwidth=".tab_width

