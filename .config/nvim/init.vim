call plug#begin('~/.vim/plugged')
Plug 'rebelot/kanagawa.nvim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
call plug#end()

inoremap jk <Esc>

set number
set relativenumber
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

syntax on
" Use new regular expression engine
set re=0

let mapleader = " "

" greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y
