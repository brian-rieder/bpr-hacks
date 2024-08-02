" brian's vimrc file 

" -------------------------------------------------------------- GENERAL CONFIG 
" enable filetype plugins
filetype plugin on

" select a colorscheme
colorscheme elflord


" fix the stupid tabs
set expandtab " use the appropriate number of spaces instead of a tab
set smarttab " <Tab> in front of a line inserts blanks according to	'shiftwidth', <BS> will delete a 'shiftwidth' worth of space
set autoindent " copy indent from current line when starting a new line
set tabstop=2 " number of spaces that a <Tab> in the file counts for
set shiftwidth=2 " number of spaces that a <Tab> counts for in specific cases

" turn colors on
syntax on

" line number config
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

" ---------------------------------------------------------------- KEY BINDINGS 
" set a better leader key
let mapleader=","

" disable ex mode
nnoremap Q <nop>

" newline w/o insert to enter in normal mode
" note: the S-Enter binding does not work in Cygwin 
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" allow exiting insert without escape key
:imap jk <Esc>

" reformat the entire fil with F7
map <F7> mzgg=G'z

" search next/search previous centering
nmap n nzz
nmap N Nzz

" ------------------------------------------------------------------- FUNCTIONS 
" allow for diff comparison to save version
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" with any JSON onscreen, run JSONFORMAT in command mode and format the JSON
command! JSONFORMAT %! jq

" powerline
set  rtp+=/home/brieder/.local/lib/python3.8/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
