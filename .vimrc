call plug#begin('~/.vim/plugged')

Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'dylanaraps/wal.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', {'do': {-> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips', { 'tag': '3.2' }
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

set history=500
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
syntax on
filetype indent plugin on

" mapleader set to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Shortcuts with leader

" Save file (write command with esc)
nmap <leader>w :w<cr>

" Copy paste with Primary Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
" Cop paste with System Clipboard
noremap <Leader>Y "+y
noremap <Leader>P "+p

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

"set pastetoggle=<F2>

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

" YouCompleteMe shortcut of GoTo Definition
nnoremap <leader>jd :YcmCompleter GoTo<CR> 
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>jD :YcmCompleter GetDoc<CR>
nnoremap <leader>jR :YcmCompleter RefactorRename

" make ycm play nice with ultisnip
let g:ycm_auto_trigger = 0

" ultisnippet
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
map <leader>use :UltiSnipsEdit

" FZF file search
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
" Silver searcher
nnoremap <silent> <leader>af :Ag<CR>



" vimtex 
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_method='latexmk'
set conceallevel=2
let g:tex_conceal='abdmg'


inoremap <c-x><c-k> <c-x><c-k>

" colorsheme
"colorscheme wal
colorscheme janah
"hi Normal ctermbg=Black
"
"
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

autocmd BufRead,BufNewFile *.tex setlocal spell
set spelllang=en


autocmd BufNewFile *.tex 0r ~/.vim/template/template.tex
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


