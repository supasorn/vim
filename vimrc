set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" original repos on github
Bundle 'EasyMotion'
Bundle 'Command-T'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'SuperTab'
Bundle 'surround.vim'
Bundle 'SearchComplete'
Bundle 'matrix.vim'

filetype plugin indent on     " required!

syntax on
set smartindent
set autoindent
set cindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set number
set ignorecase
set smartcase
set gdefault
colorscheme jellybeans
set guifont=Menlo_Regular:h13
set incsearch
set scrolloff=5
noremap Y y$
noremap ci,, T,ct,
noremap ci(, T(ct,
noremap ci,) T,ct)
noremap L w
noremap H b
noremap p ]p
noremap P ]P
let mapleader = ','
map <c-j> <leader>j
map <c-k> <leader>k
map <c-l> <leader>w
map <c-h> <leader>b
map <c-f> <leader>f
map <c-F> <leader>F
map <c-c> <plug>NERDCommenterToggle<c-m>
let g:EasyMotion_leader_key = '<leader>'
noremap <C-n> :NERDTreeToggle<CR>
set autoread
filetype plugin on

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

