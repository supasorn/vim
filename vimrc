set nocompatible               " be iMproved

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Fast
Plug 'supasorn/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dahu/vim-fanfingtastic' 
Plug 'haya14busa/incsearch.vim'

" textobject
Plug 'PeterRincker/vim-argumentative'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

" File
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/mru.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'jremmen/vim-ripgrep'
Plug 'pbogut/fzf-mru.vim'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-session'
Plug 'vim-scripts/a.vim' 
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'Shougo/neocomplcache'
Plug 'wesQ3/vim-windowswap'
Plug 'skywind3000/asyncrun.vim'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'AndrewRadev/simple_bookmarks.vim'
Plug 'junegunn/vim-peekaboo' " show registers
"Plug 'junegunn/vim-slash' " improved vim search
Plug 'tpope/vim-eunuch' " add unix commands like Rename, SudoWrite

" Colorschemes
Plug 'xolox/vim-colorscheme-switcher'
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'

" Pretty
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/indentLine'

" Misc
Plug 'xolox/vim-misc'
Plug 'vim-scripts/L9'

" Integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'airblade/vim-gitgutter'

if executable('ctags')
  Plug 'majutsushi/tagbar'
  if v:version >= 800
    Plug 'ludovicchabant/vim-gutentags'
  endif
endif

" Bookmark Display
Plug 'kshenoy/vim-signature'

" Syntax
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

set background=dark

let g:gruvbox_contrast_dark = "medium"
colorscheme gruvbox


autocmd GUIEnter * set visualbell t_vb=

"set clipboard=unnamedplus " vim's clipboard = system's clipboard
"set termguicolors
set t_Co=256
set mouse=a
set noeb
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
set display=lastline
set scrolloff=3
set autoread
set encoding=utf-8
set laststatus=2
set go-=m
set go-=r
set go-=L
set shortmess-=S

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  if match(system('uname -n'), "washington") >= 0
    set guifont=Inconsolata\ 9 
  elseif match(system('uname -n'), "raspberrypi") >= 0
    set guifont=Inconsolata\ 9 
  elseif match(system('uname -n'), "supasorn.mtv.corp.google.com") >= 0
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11 
  else
    "set guifont=Inconsolata\ for\ Powerline\ 10 
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11 
  endif
else
  "set guifont=Inconsolata:h9 
  set guifont=DejaVu_Sans_Mono_for_Powerline:h13
  "set guifont=Droid_Sans_Mono_for_Powerline:h12
endif
set completeopt-=preview

"----------------------------
""""""    Constants    """""" 
"----------------------------
let g:alternateExtensions_cc = "h,hpp,hh"
let g:alternateExtensions_hh = "cc"

let g:fugitive_force_bang_command = 1

let g:asyncrun_open = 8
let g:asyncrun_bell = 1

"let g:deoplete#enable_at_startup = 1

let g:gitgutter_enabled = 0

if os == "Linux"
  let g:EchoFuncKeyNext = '<m-j>'
  let g:EchoFuncKeyPrev = '<m-k>'
else
  let g:EchoFuncKeyNext = '<D-j>'
  let g:EchoFuncKeyPrev = '<D-k>'
endif

let g:session_autoload = 'no'
let g:session_autosave = 'yes'

let g:colorscheme_switcher_define_mappings = 0
let g:colorscheme_switcher_exclude_builtins = 1

let g:EasyMotion_leader_key = '<leader>'
let g:Tex_CompileRule_dvi = 'pdflatex \\nonstopmode \\input\{$*\}'

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let g:fuf_fuzzyRefining = 0
let g:fuf_maxMenuWidth = 150
let g:fuf_patternSeparator = ' '
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class$'
let g:fuf_keyOpenVsplit = '<C-v>'


let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_max_list = 15
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 2

if !empty(glob('~/.vim/plugged/vim-airline'))
  let g:airline_powerline_fonts = 1
  let g:airline_theme="bubblegum"
  let g:airline_section_z=airline#section#create_right(['%l'])
  let g:airline_section_warning=airline#section#create_right(['%c'])
  let g:airline_section_c = '%<%f %#__accent_red#%m%#__restore__# %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

  "let g:airline#extensions#tabline#enabled = 1
endif


let g:netrw_silent = 1

"----------------------------
""""""    Remapping    """""" 
"----------------------------
omap ia Ia 
vmap ia Ia

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

map /  <Plug>(incsearch-forward)

inoremap <expr><C-h> neocomplcache#undo_completion()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-k> neocomplcache#close_popup()

noremap Y y$
vnoremap y y`>
nnoremap j gj
nnoremap k gk

nnoremap =<SPACE> i <ESC>la <ESC>h

map <c-h> <esc>:A<CR>

"nnoremap \r :call FirstLineCompile()<CR>

"command! -nargs=1 Gr call GrepCurrentDirectory(<f-args>)
"nnoremap gr :Rg -g '!tags' --max-depth=1 '\b<cword>\b' %:p:h/<CR>
nnoremap gr :Rg <C-R><C-W><CR>
nnoremap <c-f> <esc>:cd %:p:h<CR>:Rg<CR>

"nnoremap \m :w<CR>:execute "cd %:p:h \| try \| cd bin \| catch \| try \| cd ../bin \| catch \| endtry \| endtry"<CR>:AsyncRun make %:t:r<CR>
nnoremap \m :w<CR>:execute "cd %:p:h \| try \| cd bin \| catch \| try \| cd ../bin \| catch \| endtry \| endtry"<CR>:make %:t:r<CR>
nnoremap \[ :cp<Cr>
nnoremap \] :cn<Cr>

noremap -= =a}``

map [[ ?{<CR>w99[{
map ]] j0[[%/{<CR>
vnoremap < <gv
vnoremap > >gv

nmap <F8> :TagbarToggle<CR>
"nmap <F4> :MRU<CR>/
nmap <F4> :FZFMru --no-sort<CR>
nmap <F9> :NextColorScheme<CR>
nmap <s-F9> :PrevColorScheme<CR>

"nmap \p :call EasyMotion#SelectLinesPaste()<CR>
map <c-j> <leader>j
vmap <c-j> <leader>j
map <c-k> <leader>k
vmap <c-k> <leader>k

nmap <SPACE> <leader>s
vmap <SPACE> <leader>s
map <c-c> <plug>NERDCommenterToggle<c-m>
noremap <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>:wincmd p<cr>

nmap <F5> :e %<CR>
imap <F5> <esc>:e %<CR>

"map <s-r> :History:<CR>
map <s-r> <esc>:silent exe "!tmux send -t 2 'fc -e : -1' Enter"<CR>

nmap ? :BLines<CR>
nmap <F2> :FufFileWithCurrentBufferDir<CR>
imap <F2> <esc>:FufFileWithCurrentBufferDir<CR>
nmap <s-F2> :FufRenewCache<CR>
imap <s-F2> <esc>:FufRenewCache<CR>
"nmap <F3> :Buffers<CR>
"imap <F3> <esc>:Buffers<CR>
nmap <F3> :FufBuffer<CR>
imap <F3> <esc>:FufBuffer<CR>

nmap <F6> :Files<CR>
imap <F6> <esc>:Files<CR>
nmap <F7> :Rg<CR>
imap <F7> <esc>:Rg<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

nnoremap <silent> <leader>gg :GitGutterToggle<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>

nnoremap <silent> <leader>gc :Gcommit -m "auto commit"<CR>
nnoremap <silent> <leader>gp :Git push<CR>

command! OS OpenSession
command! SS SaveSession
command! RE RestartVim
command! W w

" For jumping through function arguments
nmap <silent> ( :call JumpThroughParameter(-1)<CR>
nmap <silent> ) :call JumpThroughParameter(1)<CR>
"let blacklist = ['tex', 'txt', 'latex']
"au Filetype * if index(blacklist, &ft) < 0 | 
      "\ nmap <silent> ( :::call JumpThroughParameter(-1)<CR>|
      "\ nmap <silent> ) :call JumpThroughParameter(1)<CR>| 
      "\ endif

nmap <F10> <Plug>window:quickfix:toggle


"----------------------------
""""""     autocmd     """""" 
"----------------------------

"autocmd FileType fuf
       "\ call deoplete#custom#buffer_option('auto_complete', v:false)

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete | set ts=2 | set sw=2
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd BufNewFile,BufReadPost *.ejs set filetype=html

au Filetype *.vim nmap <F5> :so %<CR>
au BufNewFile,BufRead *.cuh set filetype=cpp

" Auto open quickfix : http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested botright cwindow 8
autocmd QuickFixCmdPost    l* nested lwindow

au FileType cu,c,cpp,py let delimitMate_matchpairs = "(:),[:]"

filetype plugin on

hi MatchParen guibg=NONE gui=underline

au BufNewFile,BufRead *.as           setf actionscript

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufWritePost *.cpp,*.h,*.c,*.cc call UpdateTags()

if filereadable(expand("~/.vim/vimrc.functions"))
  source ~/.vim/vimrc.functions
endif

augroup QuickfixStatus
    au! BufWinEnter quickfix setlocal 
        \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
augroup END

augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END
