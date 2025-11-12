-- =========================================
--  Alexandre's Neovim Configuration (Lua)
-- =========================================
-- This file bootstraps Lazy.nvim (plugin manager)
-- and loads modular configuration files for clarity.
-- Folder structure:
--   ~/.config/nvim/lua/config/
-- Each subfile defines a clean aspect of the setup.

-- Add Lazy.nvim to runtime path
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Load plugins from lua/plugins/init.lua
require("lazy").setup("plugins")

-- Load modular configs
require("config.options")   -- General settings
require("config.keymaps")   -- Key mappings
require("config.autocmds")  -- Autocommands
require("config.whichkey")  -- Which-key mappings
require("config.utils")     -- Custom helper functions (e.g. Manim integration, terminal)
require("config.coc")       -- CoC setup
require("config.indent")    -- Indent rules
require("config.ultisnips") -- UltiSnippets
require("config.vimtex")    -- VimteX
require("config.style")     -- UI style
require("config.treesitter") -- Disables treesitter for LateX since VimteX already does correct highlights
require("config.codex")

-- Set Python path (used for vimtex, coc, etc.)
vim.g.python3_host_prog = "/home/alexandre/anaconda3/bin/python"

-- ========= Syntax & Filetype =========
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

