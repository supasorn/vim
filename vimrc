set nocompatible               " be iMproved

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'branch' : '0.5-compat', 'do': 'TSUpdate'} " syntax highlighting

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'othree/html5.vim' " to properly indent js file
Plug 'rmagatti/goto-preview' " show preview with gp
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', {'branch' : 'main'} " LSP warning
" Plug 'SmiteshP/nvim-navic'
" Plug 'hrsh7th/nvim-compe' " lsp autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'


" Fast
Plug 'supasorn/vim-easymotion'
" Plug 'ggandor/lightspeed.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " used with vim-commentary to comment embedded script like js in html
Plug 'tpope/vim-commentary/' " for fast commenting
Plug 'tpope/vim-surround' " for change / delete quotes, tags
Plug 'tpope/vim-repeat' " so that . works with surround etc
Plug 'dahu/vim-fanfingtastic'  " fb for multiple lines

" textobject
Plug 'PeterRincker/vim-argumentative' " <, >, for shifting arguments. a, i, text object
Plug 'michaeljsmith/vim-indent-object' " ai, ii
Plug 'kana/vim-textobj-user' " my own =, i= for changing the RHS, LSH of equation. (Deprecated) if for changing the function call
Plug 'wellle/targets.vim' " () {} [] text object
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'} " indent object f, c, ]m ]] 
Plug 'nvim-treesitter/nvim-treesitter-context' " for context topbar

" File
Plug 'supasorn/FuzzyFinder' " F2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " F3
Plug 'pbogut/fzf-mru.vim' " F4
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'mildred/vim-bufmru' " move recently used buffer to the first in the list
Plug 'jesseleite/vim-agriculture' " RgRaw
Plug 'rbgrouleff/bclose.vim' " close buffer
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'francoiscabrol/ranger.vim'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-session'
Plug 'vim-scripts/a.vim' 
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'wesQ3/vim-windowswap' " \ww to mark two windows
Plug 'skywind3000/asyncrun.vim'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'AndrewRadev/simple_bookmarks.vim'
" Plug 'junegunn/vim-peekaboo' " show registers. conflicts with nvim-treesitter-context
Plug 'tpope/vim-eunuch' " add unix commands like Rename, SudoWrite
Plug 'svermeulen/vim-yoink' " cycle through yank with ctrl-p
Plug 'svermeulen/vim-subversive' " quick paste in normal mode, use s.. instead of v->p
Plug 'dstein64/vim-startuptime'
Plug 'svban/YankAssassin.vim' " yiw won't move cursor to the beginning
Plug 'MunifTanjim/nui.nvim' " UI elements for neovim
" Plug 'nvim-neo-tree/neo-tree.nvim'

" Colorschemes
Plug 'xolox/vim-colorscheme-switcher'
Plug 'supasorn/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'
Plug 'navarasu/onedark.nvim'

" Pretty
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'

" Misc
Plug 'xolox/vim-misc'
Plug 'vim-scripts/L9'

" Debug
" Plug 'mfussenegger/nvim-dap'
" Plug 'mfussenegger/nvim-dap-python'
" Plug 'rcarriga/nvim-dap-ui'

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

" Icon
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' 
"Plug 'akinsho/bufferline.nvim'
"Plug 'romgrk/barbar.nvim'

call plug#end()

let g:gruvbox_contrast_dark = "medium"

" colorscheme gruvbox-material
colorscheme onedark
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'medium'
set background=dark


autocmd GUIEnter * set visualbell t_vb=

"set clipboard=unnamedplus " vim's clipboard = system's clipboard
set termguicolors
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
set winblend=0

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
  "set guifont=DejaVu_Sans_Mono_for_Powerline:h13
  set guifont=DejaVu_Sans_Mono_Nerd_Font_Complete:h13
  "set guifont=Droid_Sans_Mono_for_Powerline:h12
endif
"set completeopt-=preview
"set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noselect

"----------------------------
""""""    Constants    """""" 
"----------------------------
" let g:indentLine_char = '▏'
"
let g:context_presenter = 'nvim-float'
let g:context_highlight_normal = 'Normal'

let g:netrw_liststyle = 3

let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_insert_delay = 5

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true


let g:alternateExtensions_cc = "h,hpp,hh"
let g:alternateExtensions_hh = "cc"

let g:fugitive_force_bang_command = 1

let g:asyncrun_open = 8
let g:asyncrun_bell = 1

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
  let g:airline_extensions = ['tabline', 'tagbar', 'branch']
  let g:airline_powerline_fonts = 1
  let g:airline_theme="bubblegum"
  " let g:airline_theme="gruvbox_material"
  "
  let g:airline_section_x='%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}%{airline#util#prepend("",0)}'
  let g:airline_section_y=''
  " let g:airline_section_z=airline#section#create_right(['%l'])
  let g:airline_section_z=''
  let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
  " let g:airline_section_warning=airline#section#create_right(['%c'])
  "let g:airline_section_c = '%<%f %#__accent_red#%m%#__restore__# %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

  let g:airline#extensions#tagbar#enabled = 1
  let g:airline#extensions#tagbar#flags = 'f'

  let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': ' 0. ',
        \ '1': ' 1. ',
        \ '2': ' 2. ',
        \ '3': ' 3. ',
        \ '4': ' 4. ',
        \ '5': ' 5. ',
        \ '6': ' 6. ',
        \ '7': ' 7. ',
        \ '8': ' 8. ',
        \ '9': ' 9. '
        \}
  let g:airline#extensions#tabline#left_sep = '│'
  let g:airline#extensions#tabline#left_alt_sep = '│'

endif


let g:netrw_silent = 1

function! FloatingFZF()
  let width = float2nr(&columns)
  let height = float2nr(&lines * 0.25)
  let opts = { 'relative': 'editor',
       \ 'row': (&lines - height),
       \ 'col': 0,
       \ 'width': width,
       \ 'height': height,
       \ 'style': 'minimal'
       \}

  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" let g:fzf_preview_window = ['right:hidden', 'f4']
let g:fzf_preview_window = ['right:hidden']
" let $FZF_DEFAULT_OPTS="--preview-window 'right:50%' --layout reverse --preview 'bat --color=always --style=grid --line-range :300 {} --theme=gruvbox-dark'"
let $FZF_DEFAULT_OPTS="--layout reverse"


"----------------------------
""""""    Remapping    """""" 
"----------------------------

" this is used with autocmd InsertLeave, every word under cursor is copy when
" leaving insert mode and can be pasted with "W
nmap "W "wsiw
nmap "P siw

nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
" Only set if you have telescope installed
nnoremap gR <cmd>lua require('goto-preview').goto_preview_references()<CR>
noremap gD :lua vim.lsp.buf.definition()<CR>

nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gd :vsp<CR>:lua vim.lsp.buf.definition()<CR>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <c-p> <plug>(YoinkPostPasteSwapBack)
"nmap <c-n> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

omap ia Ia  
vmap ia Ia

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

"inoremap <expr><C-h> neocomplcache#undo_completion()
"inoremap <expr><C-k> neocomplcache#close_popup()
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

noremap Y y$
vnoremap y y`>
nnoremap j gj
nnoremap k gk

nnoremap =<SPACE> i <ESC>la <ESC>h

map <c-h> <esc>:A<CR>

"nnoremap \r :call FirstLineCompile()<CR>

"command! -nargs=1 Gr call GrepCurrlive_grepentDirectory(<f-args>)
" nnoremap gr :RgRaw -g '!tags' --max-depth=1 '\b<cword>\b' %:p:h/<CR>
nnoremap gr :call RgWithMode(expand("<cword>"))<CR>

"nnoremap gr :Rg <C-R><C-W><CR>
nnoremap <c-f> :call RgWithMode("")<CR>

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

" nnoremap <silent> <F9> <Cmd>lua require'dapui'.open()<CR><Cmd>lua require'dap'.continue()<CR>
" nnoremap <silent> <s-F9> <Cmd>lua require'dap'.close()<CR>:lua require'dapui'.close()<CR>
" nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
" nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>

" nmap <F9> :NextColorScheme<CR>
" nmap <s-F9> :PrevColorScheme<CR>

"nmap \p :call EasyMotion#SelectLinesPaste()<CR>
map <c-j> <leader>j
vmap <c-j> <leader>j
map <c-k> <leader>k
vmap <c-k> <leader>k

" nmap <SPACE> <Plug>Lightspeed_omni_s
nmap <SPACE> <leader>s
vmap <SPACE> <leader>s

" map <c-c> <plug>NERDCommenterToggle<c-m>
nmap <c-c> gccj
vmap <c-c> gcc
noremap <C-n> :NERDTreeToggle %:p:h<CR>
" map <c-t> :lua require('telescope.builtin').file_browser({cwd = vim.fn.expand('%:p:h')})<CR>
 
map <s-r> :History:<CR>
" map <s-r> :lua require('fzf-lua').command_history({prompt="> "})<cr>
"map <s-e> <esc>:w<CR>:silent exe "!tmux send -t 1 'fc -e : -1' Enter"<CR>
nmap <s-e> :call FirstLineCompile()<CR>

" nmap ? :BLines<CR>
nmap ? :lua require('fzf-lua').blines({prompt="> "})<cr>

let g:fuzzy_post_command = ':TSContextEnable'
nmap <F2> :TSContextDisable<CR>:FufFileWithCurrentBufferDir<CR>
imap <F2> <esc>:TSContextDisable<CR>:FufFileWithCurrentBufferDir<CR>
" nmap <F2> :FZFExplore<CR>
" imap <F2> <esc>:TSContextDisable<CR>:FufFileWithCurrentBufferDir<CR>
" nmap <F2> :Telescope file_browser<CR>
" imap <F2> <esc>:Telescope file_browser<CR>

nmap <s-F2> :FufRenewCache<CR>
imap <s-F2> <esc>:FufRenewCache<CR>
"nmap <F3> :Telescope buffers<CR>
"imap <F3> <esc>:Telescope buffers<CR>
" nmap <F3> :lua require('fzf-lua').buffers()<cr>
" imap <F3> <esc>:lua require('fzf-lua').buffers()<cr>
nmap <F3> :Buffers<cr>
imap <F3> <esc>:Buffers<cr>
"nmap <F3> :FufBuffer<CR>
"imap <F3> <esc>:FufBuffer<CR>

nmap <F6> :Files<CR>
imap <F6> <esc>:Files<CR>
nmap <silent> <F7>  :call IterateRgMode()<CR>
imap <silent> <F7> <esc>:call IterateRgMode()<CR>

"if expand('%:t') == 'vimrc' || expand('%:t') == 'init.vim'
  "echo 'Save + Source'
  "nmap <F5> :w<CR>:so %<CR>
  "imap <F5> <esc>:w<CR>:so %<CR>
"else
  "echo 'Reload'
"endif

nmap <F5> :e %<CR>
imap <F5> <esc>:e %<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>

nnoremap <silent> <leader>gg :GitGutterToggle<CR>
nnoremap <silent> <leader>gs :Git<CR>

nnoremap <silent> <leader>gc :Git commit -m "auto commit"<CR>
nnoremap <silent> <leader>gp :Git push<CR>

command! OS OpenSession
command! SS SaveSession
command! RE RestartVim
command! W w

command! To2spaces %s;^\(\s\+\);\=repeat(' ', len(submatch(0))/2);g
command! To4spaces %s/^\s*/&&/g

" For jumping through function arguments
nmap <silent> ( :call JumpThroughParameter(-1)<CR>
nmap <silent> ) :call JumpThroughParameter(1)<CR>

"let blacklist = ['tex', 'txt', 'latex']
"au Filetype * if index(blacklist, &ft) < 0 | 
      "\ nmap <silent> ( :::call JumpThroughParameter(-1)<CR>|
      "\ nmap <silent> ) :call JumpThroughParameter(1)<CR>| 
      "\ endif

" nmap <F10> <Plug>window:quickfix:toggle

command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
    " \   fzf#vim#with_preview({'options': '--layout reverse  --with-nth=-1.. --delimiter="/"'}, 'right:50%'))
    "
nmap <Leader>og /gs<CR>f:f"yi":execute('!open '.shellescape(@"))<CR>
nmap <Leader>os /s2<CR>f:f"yi":execute('!open '.shellescape(@"))<CR>
nmap <Leader>od /dbl<CR>f:f"yi":execute('!open '.shellescape(@"))<CR>


"----------------------------
""""""     autocmd     """""" 
"----------------------------
"
" Copy the last word when leaving the insert mode to register
autocmd InsertLeave * call CopyWordUnderCursor()

"au BufEnter * :BufferLineMovePrev
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags | set ts=2 | set sw=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete | set ts=2 | set sw=2
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd BufNewFile,BufReadPost *.ejs set filetype=html

au BufNewFile,BufRead *.cuh set filetype=cpp

" Auto open quickfix : http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested botright cwindow 8
autocmd QuickFixCmdPost    l* nested lwindow

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
