set nocompatible        " be iMproved, required
filetype off            " required

" set the rutnime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle manager Vundle, required
Bundle 'gmarik/vundle'

" Bundle commands
"Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'groenewege/vim-less.git'
Bundle 'digitaltoad/vim-jade.git'
Bundle 'jtratner/vim-flavored-markdown.git'
Bundle 'hail2u/vim-css3-syntax.git'

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
set clipboard=unnamedplus
set hls

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
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Show me extra whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" Compile LessCSS on save
function LessToCss()
    let src = shellescape(expand('%:p'))
    if src !~ "_"
        let dst = shellescape(expand('%:r'))
        let command = "silent !lessc -x " . src . " " . dst . ".css"
        execute command
    endif
endfunction

autocmd BufWritePost,FileWritePost *.less call LessToCss()

" Strip trailing whitespace on save for some filetypes
autocmd FileType c,cpp,python,javascript,htmldjango,less,scss,css,make,json,jade
    \ autocmd BufWritePre <buffer> :%s/\s\+$//e

" File extension associations
au BufRead,BufNewFile *.pyt set filetype=python
au BufRead,BufNewFile *.jst set filetype=javascript
au BufRead,BufNewFile *.tmpl set filetype=htmldjango
au BufRead,BufNewFile *.html set filetype=htmldjango
au BufRead,BufNewFile master.cfg set filetype=python
au BufRead,BufNewFile *git\/config set filetype=gitconfig
au BufRead,BufNewFile *.md,*.markdown set filetype=ghmarkdown
