set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" original repos on github
Bundle 'supasorn/vim-easymotion.git'
"Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'haya14busa/vim-easyoperator-line'
Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdcommenter.git'

"Bundle 'SuperTab'

" To install YouCompleteMe
"    cd ~/.vim/bundle/YouCompleteMe
"    ./install.sh --clang-completer
"Bundle 'Valloric/YouCompleteMe.git'
Bundle 'Shougo/neocomplcache.git'
"Bundle 'Shougo/neosnippet'
"Bundle 'honza/vim-snippets.git'

" Colorschemes
Bundle 'xolox/vim-colorscheme-switcher'
"Bundle 'chriskempson/base16-vim'

Bundle 'surround.vim'
"Bundle 'SearchComplete'
Bundle 'kien/ctrlp.vim.git'
Bundle 'SingleCompile'
"Bundle 'myusuf3/numbers.vim'
Bundle 'vim-scripts/a.vim.git'
Bundle 'Raimondi/delimitMate.git'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'xolox/vim-misc.git'
Bundle 'xolox/vim-session.git'
"Bundle 'Lokaltog/powerline', {'rtp':  'powerline/bindings/vim'}
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive.git'
Bundle 'corntrace/bufexplorer.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'dahu/vim-fanfingtastic.git'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif
Bundle 'L9'
Bundle 'vim-scripts/FuzzyFinder.git'
Bundle 'kshenoy/vim-signature.git'
Bundle 'vim-scripts/mru.vim.git'
Bundle 'mbbill/undotree.git'
Bundle 'godlygeek/tabular.git'
"Bundle 'vim-scripts/VIM-Color-Picker.git'
"Bundle 'iandoe/vim-osx-colorpicker.git'
Bundle 'skammer/vim-css-color.git'
"Bundle 'terryma/vim-multiple-cursors.git'
Bundle 'othree/html5.vim.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'AndrewRadev/simple_bookmarks.vim'
Bundle 'ctags.vim'
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
set display=lastline
"set foldmethod=syntax
set scrolloff=3
set autoread

colorscheme jellybeans

let g:session_autoload = 'no'
let g:colorscheme_switcher_define_mappings = 0
let g:colorscheme_switcher_exclude = ['default', 'guardian', 'macvim', 'slate', 'torte', 'blue', 'delek', 'desert', 'elflord', 'koehler', 'morning', 'pablo', 'ron', 'zellner', 'darkblue', 'evening', 'shine', 'murphy', 'peachpuff']

"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:EasyMotion_leader_key = '<leader>'
let g:Tex_CompileRule_dvi = 'pdflatex \\nonstopmode \\input\{$*\}'
let g:Imap_UsePlaceHolders = 0
let tex_no_error=1
let g:session_autosave = 'no'
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

let g:fuf_fuzzyRefining = 1

let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_max_list = 15
" Plugin key-mappings.
inoremap <expr><C-h>     neocomplcache#undo_completion()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-k> neocomplcache#close_popup()
"imap <C-TAB>  <Plug>(neocomplcache_snippets_force_expand_or_jump)

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete | set ts=4 | set sw=4
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd BufNewFile,BufReadPost *.ejs set filetype=html

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 2


let g:airline_powerline_fonts = 1
let g:airline_theme="dark"
let g:airline_section_z=airline#section#create_right(['%l'])
let g:airline_section_warning=airline#section#create_right(['%c'])

let os = substitute(system('uname'), "\n", "", "")
if os == "Linux"
  "set guifont=Liberation\ Mono\ for\ Powerline\ 10
  "set guifont=Inconsolata\ 9 
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9 
  "set guifont=Menlo\ for\ Powerline\ 9 
else
  "set guifont=Menlo_Regular:h13
  "set guifont=Inconsolata\ for\ Powerline:h15 
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13

  "set guifont=Menlo\ for\ Powerline:h12
endif
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2

nmap \o yyPIprintf("<esc>A\n"); // GCODE <esc>

noremap Y y$
vnoremap y y`>
noremap ci,, T,ct,
noremap ci(, T(ct,
noremap ci,) T,ct)
nnoremap j gj
nnoremap k gk
nnoremap =<SPACE> i <ESC>la <ESC>h

"nnoremap ciw cw
"nnoremap diw dw
"nnoremap cw ciw
"nnoremap dw diw
map <c-h> <esc>:A<CR>

nnoremap \r :call FirstLineCompile()<CR>
nmap <F5> :call FirstLineCompile()<CR>
imap <F5> <esc>:call FirstLineCompile()<CR>

command! -nargs=1 Gr call GrepCurrentDirectory(<f-args>)
nnoremap gr :grep '\b<cword>\b' %:p:h/*<CR>

command! OS OpenSession
command! SS SaveSession
command! RE RestartVim


" For jumping through function arguments
nmap <silent> ( :call JumpThroughParameter(-1)<CR>
nmap <silent> ) :call JumpThroughParameter(1)<CR>
"let blacklist = ['tex', 'txt', 'latex']
"au Filetype * if index(blacklist, &ft) < 0 | 
      "\ nmap <silent> ( :call JumpThroughParameter(-1)<CR>|
      "\ nmap <silent> ) :call JumpThroughParameter(1)<CR>| 
      "\ endif

au Filetype *.vim nmap <F5> :so %<CR>
au BufNewFile,BufRead *.cuh set filetype=cpp

nnoremap \m :w<CR>:execute "try \| cd %:p:h \| cd bin \| catch \| \| endtry"<CR>:make %:t:r<CR>
nnoremap \[ :cp<Cr>
nnoremap \] :cn<Cr>

" Auto open quickfix
autocmd QuickFixCmdPost [^l]* nested botright cwindow 8
autocmd QuickFixCmdPost    l* nested lwindow

noremap -= =a}``
inoremap } }<Esc>=%``a

map [[ ?{<CR>w99[{
map ]] j0[[%/{<CR>
vnoremap < <gv
vnoremap > >gv
vmap F 99[{O][

nmap <F8> :TagbarToggle<CR>
nmap <F4> :MRU<CR>/
nmap <F9> :NextColorScheme<CR>
nmap <s-F9> :PrevColorScheme<CR>

imap <c-l> <Plug>IMAP_JumpForward
nmap <c-l> <Plug>IMAP_JumpForward
vmap <c-l> <Plug>IMAP_JumpForward

nmap \p :call EasyMotion#SelectLinesPaste()<CR>

map <c-j> <leader>j
vmap <c-j> <leader>j
map <c-k> <leader>k
vmap <c-k> <leader>k
map <c-f> <leader>f
map <c-g> <leader>F

nmap <SPACE> <leader>s
"nmap <SPACE> <Plug>(easymotion-s)
nmap <leader><SPACE> <Plug>(easymotion-s)
vmap <SPACE> <leader>s
map <c-c> <plug>NERDCommenterToggle<c-m>
noremap <C-n> :NERDTreeToggle<CR>
"nmap <F2> :cd %:p:h<CR>:FufFile<CR>
nmap <F2> :FufFileWithCurrentBufferDir<CR>
imap <F2> <esc>:FufFileWithCurrentBufferDir<CR>
nmap <s-F2> :FufRenewCache<CR>
imap <s-F2> <esc>:FufRenewCache<CR>
nmap <F3> :FufBuffer<CR>
imap <F3> <esc>:FufBuffer<CR>
nmap \gg {gq}<C-O><C-O>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class$'
let g:fuf_keyOpenVsplit = '<C-v>'

au FileType cu,c,cpp let delimitMate_matchpairs = "(:),[:]"

nnoremap <silent> <leader>gs :Gstatus<CR>/modified:<CR>
nnoremap <silent> <leader>gc :Gcommit -m "auto commit"<CR>
nnoremap <silent> <leader>gp :Git push<CR>

filetype plugin on

hi MatchParen guibg=NONE gui=underline

au BufNewFile,BufRead *.as           setf actionscript

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if filereadable(expand("~/.vim/vimrc.functions"))
  source ~/.vim/vimrc.functions
endif
