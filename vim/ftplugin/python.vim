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
let max_width=$MAX_PY_WIDTH
execute "let g:flake8_max_line_length=".max_width
execute "set cc=".max_width

" Ignore the following flake8 warnings:
" W391 : Blank line at EOF
let g:flake8_ignore="W391"

" configure builtins for flake8-vim
"let builtins=$FLAKE8_BUILTINS
"execute "let g:flake8_builtins=".builtins
