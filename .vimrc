call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

inoremap jk <Esc>

set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

colorscheme gruvbox
syntax on
" Use new regular expression engine
set re=0

