call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" Disable until I find a fix for "doc/tags" in repos
" call pathogen#helptags()

set nocompatible
set backspace=indent,eol,start

set t_Co=256
let g:zenburn_high_Contrast=1
colo zenburn

autocmd BufEnter * :syntax sync fromstart
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

let mapleader = ","

filetype plugin indent on

set cursorline
set enc=utf-8
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set listchars=tab:▸\ ,eol:¬
set noerrorbells
set nowrap
set number
set ruler
set scrolloff=5
set shiftwidth=4
set shm+=I
set showcmd
set smarttab
set tabstop=4
set vb t_vb=
set whichwrap+=<,>,h,l

nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :set nohlsearch<cr>
nmap <silent> <leader>. :lcd %:p:h<CR>
nmap <silent> <leader>, :NERDTreeToggle<CR>

map <F12> ggVGg?

vnoremap < <gv
vnoremap > >gv

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s

set laststatus=2

let g:ackprg="ack -H --nocolor --nogroup --column"
nmap <leader>a <Esc>:Ack!

let g:pep8_map='<leader>8'

set tags=./tags;/

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

nnoremap <space> za
vnoremap <space> zf

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let b:jslint_disabled = 1
