set nocompatible        " be iMproved, required
filetype off            " required

" set the rutnime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle manager Vundle, required
Bundle 'gmarik/vundle'

" Bundle commands
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'saltstack/salt-vim'
Bundle 'elzr/vim-json'
Bundle 'airblade/vim-gitgutter'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'

filetype plugin indent on   " required

set encoding=utf-8
set paste
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

colorscheme desert

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
execute "set cc=".max_width
let text_width=max_width - 1
execute "set textwidth=".text_width
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Show me extra whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Strip trailing whitespace on save for some filetypes
autocmd FileType c,cpp,python,javascript,htmldjango,less,scss,css,make,json,jade,markdown
    \ autocmd BufWritePre <buffer> :%s/\s\+$//e

" spell-check markdown and git commits
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" File extension associations
au BufRead,BufNewFile *.pyt set filetype=python
au BufRead,BufNewFile *.jst set filetype=javascript
au BufRead,BufNewFile *.tmpl set filetype=htmldjango
au BufRead,BufNewFile *.html set filetype=htmldjango
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile master.cfg set filetype=python
au BufRead,BufNewFile *git\/config set filetype=gitconfig
au BufRead,BufNewFile *.md,*.markdown set filetype=markdown

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
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Syntastic options
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let eslint_rules_dir=$ESLINT_RULES_DIR
if eslint_rules_dir != ""
    execute "let g:syntastic_javascript_eslint_args=' --rulesdir ".eslint_rules_dir."'"
endif
