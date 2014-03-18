" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Font (Powerline)
set guifont=Dejavu\ Sans\ Mono\ for\ Powerline:h12

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

