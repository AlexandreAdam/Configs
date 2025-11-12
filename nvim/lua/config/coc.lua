-- ========================
-- CoC (Conquer of Completion) Configuration
-- ========================

-- Basic options
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

-- ========== Smarter <Tab> Behavior ==========
-- Handles CoC popup, snippets, and indentation consistently
function _G.smart_tab()
  -- 1. If popup menu visible, go to next completion item
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn 
  end

  -- 2. If snippet can expand or jump, do that
  if vim.fn["coc#expandableOrJumpable"]() == 1 then
    return "<Plug>(coc-snippets-expand-jump)"
  end

  -- 3. If at beginning of line or after whitespace, insert proper tab (respect expandtab)
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
  end

  -- 4. Otherwise trigger completion
  return vim.fn["coc#refresh"]()
end

-- Shift-Tab: reverse navigation or unindent properly
function _G.smart_shift_tab()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn 
  else
    -- fallback to normal Shift-Tab (outdent)
    return vim.api.nvim_replace_termcodes("<C-d>", true, true, true)
  end
end

-- Bind Tab and Shift-Tab
keyset("i", "<Tab>", "v:lua.smart_tab()", opts)
keyset("i", "<S-Tab>", "v:lua.smart_shift_tab()", opts)

-- ========== Enter Key Behavior ==========
-- Accept completion or normal newline
keyset("i", "<CR>",
  [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  opts)

-- ========== Diagnostics Navigation ==========
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- ========== GoTo Code Navigation ==========
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

