set guioptions-=T 
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  macmenu Edit.Find.Find\.\.\. key=<nop>
  macmenu Edit.Find.Find\ Next key=<nop>
  map <D-j> <leader>j
  map <D-k> <leader>k
  map <D-f> <leader>f
  map <D-F> <leader>F
  map <D-g> <leader>F
endif
