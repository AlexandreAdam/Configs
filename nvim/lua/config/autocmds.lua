-- =========================================
--  Autocommands
-- =========================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local alex = augroup("alex_config", { clear = true })

-- Enable spell check for LaTeX files
autocmd({ "BufRead", "BufNewFile" }, {
  group = alex,
  pattern = "*.tex",
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Insert LaTeX template on new file creation
autocmd("BufNewFile", {
  group = alex,
  pattern = "*.tex",
  command = "0r ~/.vim/template/template.tex",
})

-- Python execution shortcuts
autocmd("FileType", {
  group = alex,
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<F9>", ':w<CR>:!python3 "%"<CR>', { buffer = true })
    vim.keymap.set("n", "<F6>", ':w<CR>:term python3 "%"<CR>', { buffer = true })
  end,
})

-- Manim scene detection / auto binding
autocmd({ "BufRead", "BufNewFile" }, {
  group = alex,
  pattern = { "*manim*.py", "*.Scene*.py", "scene_*.py" },
  callback = function()
    vim.keymap.set("n", "<leader>r", ':lua RunManimScene("l")<CR>', { buffer = true })
    vim.keymap.set("n", "<leader>R", ':lua RunManimScene("h")<CR>', { buffer = true })
  end,
})

