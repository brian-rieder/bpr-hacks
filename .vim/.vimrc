" brian's vimrc file 

" enable filetype plugins
filetype plugin on

" set a better leader key
let mapleader=","

" select a colorscheme
colorscheme desert 

" fix the stupid tabs
set expandtab " use the appropriate number of spaces instead of a tab
set smarttab " <Tab> in front of a line inserts blanks according to	'shiftwidth', <BS> will delete a 'shiftwidth' worth of space
set autoindent " copy indent from current line when starting a new line
set tabstop=2 " number of spaces that a <Tab> in the file counts for
set shiftwidth=2 " number of spaces that a <Tab> counts for in specific cases

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
set ignorecase " the case of normal letters is ignored when searching
set smartcase " override 'ignorecase' if search pattern contains uppercase characters

" show the title of the current file in the title bar
set title

" disable ex mode
nnoremap Q <nop>

" bind newline w/o insert to enter in normal
" note: the S-Enter binding does not work in Cygwin 
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" allow exiting insert without escape key
:imap jk <Esc>

" bind a file reformatting key
map <F7> mzgg=G'z
