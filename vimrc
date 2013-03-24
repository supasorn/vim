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
Bundle 'tpope/vim-fugitive.git'
Bundle 'corntrace/bufexplorer.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'dahu/vim-fanfingtastic.git'
Bundle 'ronny/birds-of-paradise.vim.git'
Bundle 'taglist.vim'
Bundle 'L9'
Bundle 'vim-scripts/FuzzyFinder.git'
Bundle 'vim-scripts/LustyJuggler.git'
"Bundle 'goldfeld/vim-seek.git'

filetype plugin indent on     " required!

syntax on
set noswapfile
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
set wildmenu
set wildmode=list:longest,full
set incsearch
set scrolloff=5
set display=lastline

colorscheme jellybeans

"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:EasyMotion_leader_key = '<leader>'
let g:Tex_CompileRule_dvi = 'pdflatex \\nonstopmode \\input\{$*\}'
let tex_no_error=1
let g:session_autosave = 'no'
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  "set guifont=Inconsolata\ 12
  set guifont=Menlo_for_Powerline:h13
  let g:Powerline_symbols = 'fancy'
else
  "set guifont=Menlo_Regular:h13
  "set guifont=Menlo_for_Powerline:h13
  set guifont=Menlo_for_Powerline:h12
  let g:Powerline_symbols = 'fancy'
endif
set laststatus=2

noremap Y y$
vnoremap y y`>
noremap ci,, T,ct,
noremap ci(, T(ct,
noremap ci,) T,ct)
nnoremap j gj
nnoremap k gk
nnoremap \r :SCCompileRun<CR>:silent botright cw 8<CR>
nnoremap \m :w<CR>:make %:t:r<CR>:botright cw 8<CR>
nnoremap \[ :cp<Cr>
nnoremap \] :cn<Cr>
noremap -= =a}''
imap <c-l> <Plug>IMAP_JumpForward
nmap <c-l> <Plug>IMAP_JumpForward
map <c-j> <leader>j
map <c-k> <leader>k
map <c-f> <leader>f
map <c-g> <leader>F
nmap <SPACE> <leader>f
map <c-c> <plug>NERDCommenterToggle<c-m>
noremap <C-n> :NERDTreeToggle<CR>
nmap <F2> :cd %:h<CR>:FufFile<CR>
nmap <F3> :cd %:h<CR>:FufBuffer<CR>
imap <F2> <esc>:cd %:h<CR>:FufFile<CR>
imap <F3> <esc>:cd %:h<CR>:FufBuffer<CR>
nmap <F4> \lj
imap <F4> <esc>\lj
set autoread
filetype plugin on

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set grepprg=grep\ -nH\ $*
