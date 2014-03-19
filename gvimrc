" Zsh setzten
set shell=zsh\ -i

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Größe
set lines=50 columns=100

" Scroll-Leisten entfernen
set guioptions-=l
set guioptions-=r
set guioptions-=b

" Font (Powerline)
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

