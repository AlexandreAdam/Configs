-- ========= Indentation Settings =========

-- Global defaults: 2 spaces everywhere
vim.o.expandtab = true      -- Use spaces instead of tabs
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Python: 4 spaces per tab (PEP 8)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})

