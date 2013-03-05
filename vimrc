set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" original repos on github
Bundle 'EasyMotion'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'SuperTab'
Bundle 'surround.vim'
Bundle 'SearchComplete'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'ctrlp.vim'
Bundle 'SingleCompile'
Bundle "myusuf3/numbers.vim"
Bundle 'Solarized'
Bundle 'Raimondi/delimitMate.git'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'xolox/vim-session.git'
Bundle 'Lokaltog/vim-powerline'

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

"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  set guifont=Inconsolata\ 12
else
  set guifont=Menlo_Regular:h13
endif
set incsearch
set scrolloff=5
noremap Y y$
vnoremap y y`>
noremap ci,, T,ct,
noremap ci(, T(ct,
noremap ci,) T,ct)
nnoremap j gj
nnoremap k gk
nnoremap \r :SCCompileRun<CR>:botright cw 8<CR>
nnoremap \[ :cp<Cr>
nnoremap \] :cn<Cr>
noremap =- =i}''
let g:EasyMotion_leader_key = '<leader>'
let mapleader = ','
map vp BPldw
map <c-j> <leader>j
map <c-k> <leader>k
map <c-l> <leader>w
map <c-h> <leader>b
map <c-f> <leader>f
map <c-g> <leader>F
map <c-c> <plug>NERDCommenterToggle<c-m>
noremap <C-n> :NERDTreeToggle<CR>
set autoread
filetype plugin on

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


set grepprg=grep\ -nH\ $*
let g:Tex_CompileRule_dvi = 'pdflatex \\nonstopmode \\input\{$*\}'

let tex_no_error=1
