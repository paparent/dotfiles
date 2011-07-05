call pathogen#runtime_append_all_bundles()
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
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

set tags=./tags;/

autocmd FileType python set omnifunc=pythoncomplete#Complete


