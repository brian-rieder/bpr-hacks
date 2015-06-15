" my vimrc file 

" enable filetype plugins
filetype plugin on

" set a better leader key
let mapleader=","

" select a colorscheme
colorscheme evening 

" fix the stupid tabs
set expandtab
set smarttab
set ts=2
set shiftwidth=2

" turn colors on
syntax on

" line number config
highlight LineNr ctermfg=grey
set number

" allow 'hard' backspace in insert mode
set backspace=indent,eol,start 

" enable smarter case-sensitivity for searches
" /copyright      " Case insensitive
" /Copyright      " Case sensitive
" /copyright\C    " Case sensitive
" /Copyright\c    " Case insensitive
set ignorecase
set smartcase

" show the title of the current file in the title bar
set title
