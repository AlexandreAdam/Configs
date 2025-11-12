 -- ========= Treesitter Config =========
local ok, ts = pcall(require, "nvim-treesitter.configs")
if ok then
  ts.setup({
    highlight = {
      enable = true,
      disable = { "latex" },   -- disable treesitter for LaTeX
    },
    indent = { enable = true, disable = { "latex" } },
  })
end
