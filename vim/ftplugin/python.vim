" Python specific rules

" Just in case my global changes
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal commentstring=\ #\ %s

let python_highlight_all=1
map run :w<cr> :!python %<cr>

" Setup flake8 preferences
let max_width=$MAX_WIDTH
execute "let g:flake8_max_line_length=".max_width

" Ignore the following flake8 warnings:
" W391 : Blank line at EOF
let g:flake8_ignore="W391"
