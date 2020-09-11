
call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

set history=500
syntax on
filetype indent plugin on

" mapleader set to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Shortcuts with leader

" Save file (write command with esc)
nmap <leader>w :w<cr>

set wildmenu
" Ignore compiled file
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*

set ruler
set encoding=utf-8
set mouse=a
set autoindent
set ignorecase
set hlsearch
set incsearch

" RegexMagic
set magic
set showmatch

set noerrorbells
set novisualbell

set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs to avoid confusion with other editors
set expandtab
set smarttab

" Moving between windows with ctrl+(move command)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext


" vimtex 
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'


" ultisnippet
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" colorsheme
Plug 'dylanaraps/wal.vim'
colorscheme wal
hi Normal guibg=#111111 ctermbg=black
