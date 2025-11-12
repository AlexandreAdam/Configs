return {
  -- Core
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- Colorschemes
  { "flazz/vim-colorschemes" },
  { "folke/tokyonight.nvim" },
  { "bluz71/vim-moonfly-colors", name = "moonfly" },
  { "xiyaowong/transparent.nvim" },
  { "jacoborus/tender.vim" },

  -- UI + Navigation
  { "folke/which-key.nvim", config = true },
  { "scrooloose/nerdtree" },
  { "PhilRunninger/nerdtree-visual-selection" },
  { "preservim/nerdcommenter" },

  -- Git
  { "tpope/vim-fugitive" },
  { "airblade/vim-gitgutter" },

  -- Text editing
  { "tpope/vim-surround" },
  { "myusuf3/numbers.vim" },
  { "KeitaNakamura/tex-conceal.vim" },
  { "terryma/vim-multiple-cursors" },
  
  -- Conquer of Completion
  {"neoclide/coc.nvim", branch = "release", lazy = false, priority = 1000},

  -- Terminal
  {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],  -- ← this is the key you used!
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      direction = "float",       -- floating popup terminal
      close_on_exit = true,
      float_opts = {
        border = "double",
      },
    })
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },

  -- LSP + Completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "lervag/vimtex" },

  -- Snippets
  { "sirver/ultisnips" },

  -- Fuzzy finder
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    build = ":call fzf#install()",
  },

  -- Formatter
  { "averms/black-nvim" },

  -- Copilot
  { "github/copilot.vim" },

  -- AI assistant (Codex)
  {
    "johnseth97/codex.nvim",
    cmd = { "Codex", "CodexToggle" },
    keys = {
      {
        "<leader>ac",
        function() require("codex").toggle() end,
        desc = "Toggle Codex window",
        mode = { "n", "v" },
      },
    },
    opts = {
      keymaps = {
        toggle = nil,       -- disable internal default keymap
        quit = "<C-q>",     -- Ctrl+q closes the popup
      },
      border = "rounded",   -- "single", "double", or "rounded"
      width = 0.8,          -- 80% of screen width
      height = 0.8,         -- 80% of screen height
      model = "gpt-5-nano",    -- optional model override
      autoinstall = true,   -- automatically install @openai/codex if missing
    },
  },
   -- Syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python", "lua", "latex", "json", "markdown", "vim", "bash",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  }, 
}

