-- ========= Codex model management =========

local codex = require("codex")

-- Current active model (tracked locally)
_G.CodexModel = "gpt-5-nano"

-- Helper function to set model dynamically
function _G.SetCodexModel(model)
  _G.CodexModel = model
  codex.setup({
    model = model,
    autoinstall = true,
    border = "rounded",
    width = 0.8,
    height = 0.8,
  })
  vim.notify("Codex model set to " .. model, vim.log.levels.INFO)
end

-- Initial setup (default model)
SetCodexModel("gpt-5-nano")
