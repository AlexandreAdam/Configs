-- ========= Dynamic Colors with Floating Window Protection =========

vim.opt.termguicolors = true
vim.opt.background = "dark"

local default_scheme = "tokyonight-night"
local writing_scheme = "tender"

local function set_colorscheme(name)
  local ok = pcall(vim.cmd, "colorscheme " .. name)
  if not ok then return end
  if pcall(require, "transparent") then
    pcall(vim.cmd, "TransparentEnable")
  end
end

-- Load default scheme
set_colorscheme(default_scheme)

local group = vim.api.nvim_create_augroup("DynamicColors", { clear = true })
local last_ft, last_bt

-- Track previous buffer before switching
vim.api.nvim_create_autocmd("BufLeave", {
  group = group,
  callback = function()
    last_ft = vim.bo.filetype
    last_bt = vim.bo.buftype
  end,
})

-- Auto-switch themes, skipping transient/floating transitions
vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  callback = function()
    local ft = vim.bo.filetype
    local bt = vim.bo.buftype
    local win_conf = vim.api.nvim_win_get_config(0)

    -- Skip if entering or leaving floating/special buffers
    if win_conf.relative ~= "" then return end
    if bt ~= "" or vim.tbl_contains({ "nofile", "prompt", "terminal" }, bt) then return end
    if vim.tbl_contains({ "codex", "TelescopePrompt", "NvimTree", "tex", "plaintex", "markdown" }, ft) then return end
    if last_bt ~= nil and last_bt ~= "" then return end

    set_colorscheme(default_scheme)
  end,
})

-- Dedicated rule for writing filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "tex", "plaintex", "markdown" },
  callback = function() set_colorscheme(writing_scheme) end,
})

