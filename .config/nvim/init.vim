" Packer, the setup is in lua/plugins.lua
lua require('plugins')
" Other lua configs
lua require('coc')
"lua require('toggleterm') 
lua require('utils')

" Map <F6> to utils
"nnoremap <F6> :lua require('utils').start_terminal_in_conda_env()<CR>
""vim.api.nvim_set_keymap('n', '<F6>', [[<Cmd>lua require('lua').start_terminal_in_conda_env()<CR>]], {noremap = true, silent = true})


" ========= General configs =========
set shell=bash
set history=500
set undodir=~/.config/nvim/undodir "Important to separate the undodir between vim and nvim
set undofile
set undolevels=1000
set undoreload=10000
syntax on
filetype indent plugin on
" Allows NERDTree to create/rename modify files
set modifiable 
" Used for commandline completion
set wildmenu
" Ignore compiled file
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*
set ruler 
set encoding=utf-8
" Enable the mouse
set mouse=a
set autoindent
" Set the number of spaces for tab, cab be modified per filetype in ftplugin
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set ignorecase
set hlsearch
set incsearch
set autoread
" RegexMagic
set magic
set showmatch
" Remove annoying system sounds
set noerrorbells
set novisualbell
" Since we have fancy undodir, remove this clutter
set nobackup
set nowb
set noswapfile
" Use spaces instead of tabs to avoid confusion with other editors
set expandtab
set smarttab

" ========= Mappings =========
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

" Moving between windows with ctrl+(move command)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
nmap <leader>t# :tabn 
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprevious<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove<cr>

" ToggleTerminal Use <C-\> to toggle a terminal

" Manage NerdTree
let NERDTreeShowBookmarks=1
"let g:NERDTreeChDirMode=0
let NERDTreeChDirMode = 2 " Make current dir the cwd
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
nmap <leader>nt :NERDTreeToggle<CR>
"map <leader>ntc :NERDTreeClose<CR>
"map <leader>ntf :NERDTreeFind<CR>

" Markdown Preview (works only in markdown files)
autocmd FileType markdown nnoremap <buffer> <leader>mp :MarkdownPreview<CR>
autocmd FileType markdown nnoremap <buffer> <leader>ms :MarkdownPreviewStop<CR>
autocmd FileType markdown nnoremap <buffer> <leader>mt :MarkdownPreviewToggle<CR>
 
" You Complete Me
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_use_clangd = 0

" YouCompleteMe shortcut of GoTo Definition
"nnoremap <leader>jd :YcmCompleter GoTo<CR> 
"nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
"nnoremap <leader>jD :YcmCompleter GetDoc<CR>
"nnoremap <leader>jR :YcmCompleter RefactorRename

" CoC completer
" Don't forget to run :CocInstall coc-json coc-tsserver coc-pyright coc-vimtex
" :checkhealth is useful
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gu :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set completeopt=menu,preview,menuone,noinsert
" Change python interpreter on the fly
nmap <leader>cocpython :CocCommand python.setInterpreter
nmap <leader>coclinter :CocCommand python.setLinter

" Ultisnippet
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="horizontal"
"let g:UltiSnipsSnippetDirectories="UltiSnips"
nmap <leader>use :UltiSnipsEdit<CR>

" Vimspector
"let g:vimspector_enable_mappings = 'HUMAN'
"" for normal mode - the word under the cursor
"nmap <Leader>di <Plug>VimspectorBalloonEval
"" for visual mode, the visually selected text
"xmap <Leader>di <Plug>VimspectorBalloonEval

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

" ChatGPT
let g:chat_gpt_max_tokens=5000
let g:chat_gpt_model='gpt-3.5-turbo'
nmap <leader>chat :ChatGPT<CR>
" vnoremap to make this work on visual selections
vnoremap <leader>crun :ChatGPTRun

" Custom cheat sheet
map <leader>cheat :sp ~/.vim/cheatsheet.md

" Open vimrc
map <leader>vimrc :sp ~/.config/nvim/init.vim


inoremap <c-x><c-k> <c-x><c-k>

" colorsheme
"colorscheme tender
"colorscheme moonfly
colorscheme tokyonight-night
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon
map <leader><F1> :TransparentToggle<CR>

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

autocmd BufRead,BufNewFile *.tex setlocal spell
set spelllang=en,fr

autocmd BufNewFile *.tex 0r ~/.vim/template/template.tex

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd Filetype python nnoremap <buffer> <F6> :w<CR>:ter python3 "%"<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" Always use the base python
let g:python3_host_prog = '~/anaconda3/envs/base3.8/bin/python'

