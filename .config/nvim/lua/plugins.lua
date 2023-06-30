--packer = require 'packer' 
--packer.init {
    
--}
--local use = packer.use 
--packer.reset()

--packer.startup(function()
return require('packer').startup(function(use)
    --Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Original Vim setup
    use 'myusuf3/numbers.vim'
    use 'flazz/vim-colorschemes'
    use 'dylanaraps/wal.vim'
    use 'KeitaNakamura/tex-conceal.vim'
    use 'terryma/vim-multiple-cursors'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'scrooloose/nerdtree' --, { 'on': 'NERDTreeToggle' }
    use 'PhilRunninger/nerdtree-visual-selection' 
    use 'preservim/nerdcommenter'
    use({"iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })
    use 'airblade/vim-gitgutter'
    use 'lervag/vimtex'
    use 'sirver/ultisnips' --, { 'tag': '3.2' }
    -- Requires --system-clang on Ubuntu 18.04, since glibc version < 2.29. Also,
    -- requires at least clang-10 which can be installed from apt-get. 
    --use {'Valloric/YouCompleteMe', run = './install.py --all --system-libclang'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'junegunn/fzf.vim',
            requires = { 'junegunn/fzf', run = ':call fzf#install()' }
        }
    ---- Neovim setup
    use({'jackMort/ChatGPT.nvim',
        config = function()
            require('chatgpt').setup(
            {
                openai_params = {
                  model = "gpt-3.5-turbo",
                  frequency_penalty = 0,
                  presence_penalty = 0,
                  max_tokens = 300,
                  temperature = 0,
                  top_p = 1,
                  n = 1,
            },
            }
            )
            end,
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    })
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- Some colorschemes
    use 'jacoborus/tender.vim'
    use 'folke/tokyonight.nvim' 
    use 'xiyaowong/transparent.nvim' 
    use {'bluz71/vim-moonfly-colors', as = 'moonfly' }
end)

