-- =========================================
--  Minimal Keymaps (non-which-key)
-- =========================================
vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window movement (not shown by which-key)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

