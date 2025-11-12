-- =========================================
--  General Options
-- =========================================

local opt = vim.opt

-- Shell and file handling
opt.shell = "bash"
opt.encoding = "utf-8"
opt.history = 500
opt.undodir = vim.fn.stdpath("config") .. "/undodir" -- persistent undo files
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000

-- UI tweaks
opt.mouse = "a"        -- enable mouse support
opt.ruler = true        -- show cursor position
opt.showmatch = true    -- highlight matching parentheses
opt.hlsearch = true     -- highlight search matches
opt.incsearch = true    -- incremental search
opt.ignorecase = true   -- ignore case in search
opt.smartcase = true    -- ... unless capital letter used
opt.magic = true        -- regex magic mode
opt.errorbells = false  -- disable error beep
opt.visualbell = false  -- disable visual bell
opt.number = true       -- show line numbers
opt.relativenumber = true
opt.spelllang = { "en", "fr" }
opt.conceallevel = 2    -- pretty symbols for latex, markdown

-- Indentation
opt.autoindent = true
opt.smarttab = true
opt.expandtab = true
opt.tabstop = 8
opt.shiftwidth = 4
opt.softtabstop = 4

-- File and backup handling
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.autoread = true
opt.modifiable = true

-- Wildmenu and completion
opt.wildmenu = true
opt.wildignore = { "*.o", "*~", "*.pyc", "*/.git/*" }
opt.completeopt = { "menu", "menuone", "noinsert" }

-- Misc
opt.mousemodel = "popup"    -- right-click context
opt.hidden = true           -- keep buffers loaded when switching
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true    -- 24-bit color support

