syntax on
syntax enable
" folding
set foldmethod=indent
set foldlevel=20

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

let g:python3_host_prog = '/Users/han/anaconda3/bin/python'


call plug#begin('~/.config/nvim/plugged')
" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'iamcco/markdown-preview.vim'



" syntax check
Plug 'dense-analysis/ale'

" Formater
Plug 'Chiel92/vim-autoformat'


call plug#end()
" enable ncm2 for all buffers
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END

" Basic mapping
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to tab
noremap <LEADER>tt :%s/    /\t/g

" U/E keys for 5 times u/e 
noremap <silent> U 5k
noremap <silent> E 5j

" Insert Mode
inoremap <C-a> <ESC>A

" Split the screens
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Place two screens side by side
noremap sv <C-w>t<C-w>K
" Place two screens up and down
noremap ss <C-w>t<C-w>H
" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" voggle between buffers #en n=1, 2, 3...
noremap <LEADER>1 :e#1<CR>
noremap <LEADER>2 :e#2<CR>
noremap <LEADER>3 :e#3<CR>
noremap <LEADER>4 :e#4<CR>

" Tab
" New tab
noremap tu :tabe<CR>
" change around tabs
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move around tabs
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

" Terminal window
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>
noremap <LEADER>ip :set splitbelow<CR>:sp<CR>:term ipython<CR>


" Markdown preview
noremap <LEADER>r :MarkdownPreview<CR>

" key mapping
autocmd BufWinEnter *.py nnoremap <LEADER>r :w<CR>:!python %:p<CR>
noremap <LEADER>. :vs<CR>:term ipython<CR>
" let base16colorspace=256
" colorscheme base16-gruvbox-dark-hard
" set background=dark

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
" Autoformatter
noremap <LEADER>, :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
let g:formatter_yapf_style = 'flake8'
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_pylint_args = '-E'
" neomake
call neomake#configure#automake('w')
" NERDTREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

