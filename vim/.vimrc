set nocompatible        " be iMproved, required
filetype off            " required

" Start plug
call plug#begin('~/.vim/plugged')

" Plug plugins
Plug 'yuezk/vim-js'
Plug 'elzr/vim-json'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'ajh17/Spacegray.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'w0rp/ale'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'flowtype/vim-flow'
Plug 'prettier/vim-prettier'

" Initialize plugin system
call plug#end()

set encoding=utf-8
set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set incsearch
set ruler
set wildmenu
set wildmode=longest:full,list:full
set commentstring=\ #\ %s
set clipboard=unnamed
set hls
set nu
set backupcopy=yes

colorscheme spacegray

syntax on

let &titlestring = expand("%:p") . ": (" . hostname() . ")"
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

" easier navigation between panes
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Highlight some relevant columns
let max_width=$MAX_WIDTH
if max_width
    execute "set cc=".max_width
endif
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Show me extra whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Strip trailing whitespace on save for some filetypes
autocmd FileType c,cpp,python,javascript,htmldjango,less,scss,css,make,json,jade,markdown,ghmarkdown
    \ autocmd BufWritePre <buffer> :%s/\s\+$//e

" spell-check markdown and git commits
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" File extension associations
au BufRead,BufNewFile *.pyt set filetype=python
au BufRead,BufNewFile *.tmpl set filetype=htmldjango
au BufRead,BufNewFile *.html set filetype=htmldjango
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile master.cfg set filetype=python
au BufRead,BufNewFile *git\/config set filetype=gitconfig
au BufRead,BufNewFile *.md,*.markdown set filetype=ghmarkdown
au BufRead,BufNewFile *.tsx set filetype=typescript
au BufRead,BufNewFile .babelrc set filetype=json
au BufRead,BufNewFile *.overrides,*.variables set filetype=less

" Run Prettier on save for some filetypes
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.json PrettierAsync

" Enable JSDoc syntax highlighting
let g:javascript_plugin_jsdoc = 1

" Enable Flow syntax highlighting
let g:javascript_plugin_flow = 1

"" Shortcut to sign comment
:iab <expr> jbb strftime("(@job13er %Y-%m-%d)")

" Shortcut for livedown toggling for markdown preview
nmap gm :LivedownToggle<CR>
let g:livedown_browser = "safari"

let g:ale_history_log_output = 1

" Linter setup
let g:ale_linters = {
\  'python': ['flake8'],
\  'javascript': ['eslint', 'flow']
\}

" Flow setup
let g:flow#autoclose = 1

" Custom status line
set laststatus=2            " Always show status line
set statusline=%f           " file path from CWD
set statusline+=\           " blank space
"set statusline+=%l          " Current line
"set statusline+=/           " Separator
"set statusline+=%L          " Total lines

"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=\           " blank space
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
