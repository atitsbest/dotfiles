" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Größe
set lines=50 columns=100

" Font (Powerline)
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

