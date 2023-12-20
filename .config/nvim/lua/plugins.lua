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
    --use 'puremourning/vimspector'  Does not work too well and slow
    use {"akinsho/toggleterm.nvim", tag = '*', 
    config = function() require("toggleterm").setup({
          size = 20,
          open_mapping = [[<c-\>]],
          hide_numbers = true, -- hide the number column in toggleterm buffers
          shade_filetypes = {},
          autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
          shade_terminals = true, 
          start_in_insert = true,
          insert_mappings = true, -- whether or not the open mapping applies in insert mode
          terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
          persist_size = true,
          persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
          direction = 'float',
          close_on_exit = true, -- close the terminal window when the process exits
          auto_scroll = true, -- automatically scroll to the bottom on terminal output
          float_opts = {
                border = 'double', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
              },
        }) end
    }
    
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
   use 'github/copilot.vim'
   use({'jackMort/ChatGPT.nvim',
        config = function()
            require('chatgpt').setup(
            {
                api_key_cmd = "gpg --decrypt /home/alexandre/openai_key.txt.gpg",
                openai_edit_params = {
                  model = "code-davinci-edit-001",
                  temperature = 0,
                  top_p = 1,
                  n = 1,
                },
                openai_params = {
                  model = "gpt-3.5-turbo",
                  frequency_penalty = 0,
                  presence_penalty = 0,
                  max_tokens = 2000,
                  temperature = 0,
                  top_p = 1,
                  n = 1,
                },
            }
            ) end,
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    })
    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
        }
        --require('which_key_config').which_key_config() -- Load your which-key configurations
    end
    }
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

