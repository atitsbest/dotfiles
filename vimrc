" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set lazyredraw
set encoding=utf-8  " Set default encoding to UTF-8
set autowrite     " Automatically save before :next, :make etc.
set autoread      " Automatically reread changed files without asking me anything

set lazyredraw    " Wait to redraw "
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

set ignorecase    " Search case insensitive...
set smartcase     " ... but not when search pattern contains upper case characters

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=128
set re=1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<Space>
endif

" Color scheme
colorscheme Tomorrow
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remove search highlight
map <ESC><ESC> :nohlsearch<CR>

" configure syntastic syntax checking to check on open as well as save
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" speed up syntax highlighting 
set nocursorcolumn 
set nocursorline 
syntax sync minlines=256 
set synmaxcol=128 
set re=1 

let &t_Co=256

set nowrap

" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Reindent whoel file
map <F7> mzgg=G`z<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =


" === nginx ===
au FileType nginx setlocal noet ts=4 sw=4 sts=4

" === Go ===
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
let g:go_auto_type_info = 1

"Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0

" Airline
let g:airline_powerline_fonts = 1

" Preview-Window bei Autocomplete nicht öffnen
" set completeopt-=preview

" Damit mit der Mouse gescrollt werden kann.
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_min_num_of_chars_for_completion = 1 

let g:go_fmt_fail_silently = 1 
let g:go_fmt_command = "gofmt" 

au FileType go nmap gd <Plug>(go-def) 
au FileType go nmap <Leader>s <Plug>(go-def-split) 
au FileType go nmap <Leader>v <Plug>(go-def-vertical) 
au FileType go nmap <Leader>t <Plug>(go-def-tab) 

au FileType go nmap <Leader>i <Plug>(go-info) 

au FileType go nmap  <leader>r  <Plug>(go-run) 
au FileType go nmap  <leader>b  <Plug>(go-build) 

au FileType go nmap <Leader>d <Plug>(go-doc) 


" " ==================== UltiSnips ==================== 
" function! g:UltiSnips_Complete() 
" call UltiSnips#ExpandSnippetOrJump() 
" if g:ulti_expand_or_jump_res == 0 
" if pumvisible() 
" return "\<C-N>" 
" else 
" return "\<TAB>" 
" endif 
" endif 
"
" return "" 
" endfunction 
"  
" function! g:UltiSnips_Reverse() 
" call UltiSnips#JumpBackwards() 
" if g:ulti_jump_backwards_res == 0 
" return "\<C-P>" 
" endif 
"
" return "" 
" endfunction 
"
" if !exists("g:UltiSnipsJumpForwardTrigger") 
" let g:UltiSnipsJumpForwardTrigger = "<tab>" 
" endif 
"
" if !exists("g:UltiSnipsJumpBackwardTrigger") 
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
" endif 
"
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>" 
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>" 
 
" ==================== NerdTree ====================
" " Open nerdtree in current dir, write our own custom function because
" " NerdTreeToggle just sucks and doesn't work for buffers
function! g:NerdTreeFindToggle()
    if nerdtree#isTreeOpen()
        exec 'NERDTreeClose'
    else
        exec 'NERDTreeFind'
    endif
endfunction

" For toggling
noremap <Leader>n :<C-u>call g:NerdTreeFindToggle()<cr> 

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

map <leader>t :Rake test<cr>
map <leader>s :Rserver -b 0.0.0.0<cr>
map <leader>e :DBExecSQLUnderCursor<cr>

" Reindent whole file
map <leader>kd mzgg=G`z<cr>

" Trim all whitespaces away
nnoremap <leader>rw :%s/\s\+$//<cr>:let @/=''<cr>
