let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8


" noremap = nzz
" noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K 

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"function! BuildYCM(info)
"  " info is a dictionary with 3 fields
"  " - name:   name of the plugin
"  " - status: 'installed', 'updated', or 'unchanged'
"  " - force:  set on PlugInstall! or PlugUpdate!
"  if a:info.status == 'installed' || a:info.force
"    !./install.py
"  endif
"endfunction

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'

" vim theme
Plug 'connorholyday/vim-snazzy'

" UI realated
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()

let g:SnazzyTransparent = 1
color snazzy


highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" neomake
