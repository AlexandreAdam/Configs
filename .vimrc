call plug#begin('~/.vim/plugged')

Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'dylanaraps/wal.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips', { 'tag': '3.2' }
" Requires --system-clang on Ubuntu 18.04, since glibc version < 2.29. Also,
" requires at least clang-10 which can be installed from apt-get. 
Plug 'Valloric/YouCompleteMe', {'do': './install.py --all --system-libclang'}
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

" Save file (write command with esc)
nmap <leader>w :w<cr>

" Copy paste with Primary Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
" Copy paste with System Clipboard
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
set autoread

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

set pastetoggle=<F2>

" Moving between windows with ctrl+(move command)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>t# :tabn 
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Manage NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
map <leader>ntt :NERDTreeToggle<CR>
map <leader>ntc :NERDTreeClose<CR>
map <leader>ntf :NERDTreeFind<CR>

" Markdown Preview add the <buffer> so that this works
autocmd FileType markdown nnoremap <buffer> <leader>mp :MarkdownPreview<CR>
autocmd FileType markdown nnoremap <buffer> <leader>ms :MarkdownPreviewStop<CR>
autocmd FileType markdown nnoremap <buffer> <leader>mt :MarkdownPreviewToggle<CR>
 
" You Complete Me
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_use_clangd = 0

" YouCompleteMe shortcut of GoTo Definition
nnoremap <leader>jd :YcmCompleter GoTo<CR> 
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>jD :YcmCompleter GetDoc<CR>
nnoremap <leader>jR :YcmCompleter RefactorRename

" Ultisnippet
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="horizontal"
map <leader>use :UltiSnipsEdit<CR>

" FZF file search
nnoremap <silent> <leader>F :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
let g:fzf_action = {'ctrl-t': 'tab split','ctrl-x': 'split', 'ctrl-v': 'vsplit' }
" Makes it so FzF does not consider filename when searching
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Silver searcher
"nnoremap <silent> <leader>af :Ag<CR>


" vimtex 
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
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
set spelllang=en,fr

autocmd BufNewFile *.tex 0r ~/.vim/template/template.tex

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Custom cheat sheet
map <leader>cheat :sp ~/.vim/cheatsheet.md

" Open vimrc
map <leader>vimrc :sp ~/.vimrc

