" Python specific rules

" Just in case my global changes
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal commentstring=\ #\ %s

let python_highlight_all=1
map run :w<cr> :!python %<cr>

