-- =========================================
--  Which-key Configuration (full mapping)
-- =========================================

local wk = require("which-key")
local utils = require("config.utils")

wk.setup({
  plugins = { spelling = true },
  window = { border = "rounded" },
})

wk.add({
  -- 🎨 Background / Colors
  { "<leader>b", group = "Background / Colors" },
  { "<leader>bt", ":TransparentToggle<CR>", desc = "Toggle transparency" },
  -- Tokyonight variants
  { "<leader>bn", ":colorscheme tokyonight-night<CR>", desc = "Tokyonight (Night)" },
  { "<leader>bs", ":colorscheme tokyonight-storm<CR>", desc = "Tokyonight (Storm)" },
  { "<leader>bm", ":colorscheme tokyonight-moon<CR>", desc = "Tokyonight (Moon)" },
  { "<leader>bd", ":colorscheme tokyonight-day<CR>", desc = "Tokyonight (Day)" },
  -- Other color schemes
  { "<leader>bl", ":colorscheme tender<CR>", desc = "Tender" },
  { "<leader>bf", ":colorscheme moonfly<CR>", desc = "Moonfly" },

  -- 💾 File operations
  { "<leader>w", ":w<CR>", desc = "Save file" },
  { "<leader>vimrc", ":sp ~/.config/nvim/init.lua<CR>", desc = "Open init.lua" },
  { "<leader>cheat", ":sp ~/.vim/cheatsheet.md<CR>", desc = "Open cheatsheet" },

  -- 📂 File tree (NERDTree)
  { "<leader>n", group = "File tree" },
  { "<leader>nt", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
  { "<leader>no", ":NERDTreeFocus<CR>", desc = "Focus NERDTree" },

  -- 📋 Clipboard
  { "<leader>y", '"+y', desc = "Yank to clipboard", mode = {"n", "v" } },
  { "<leader>p", '"+p', desc = "Paste from clipboard", mode = {"n", "v" } },

  -- 🧭 Navigation
  { "<leader>t", group = "Tabs" },
  { "<leader>tn", ":tabnext<CR>", desc = "Next tab" },
  { "<leader>tp", ":tabprevious<CR>", desc = "Previous tab" },
  { "<leader>to", ":tabonly<CR>", desc = "Close other tabs" },
  { "<leader>tc", ":tabclose<CR>", desc = "Close tab" },
  { "<leader>tm", ":tabmove<CR>", desc = "Move tab" },

  -- 🪄 AI (Codex)
  { "<leader>a", group = "AI (Codex)" },
  { "<leader>ac", function() require("codex").toggle() end, desc = "Toggle window" },
  { "<leader>as", function() print(require("codex").status()) end, desc = "Show status" },
  {
    mode = { "n", "v" },
    { "<leader>ae", "<cmd>CodexExplain<CR>", desc = "Explain code" },
    { "<leader>af", "<cmd>CodexFix<CR>", desc = "Fix issues" },
    { "<leader>ar", "<cmd>CodexRefactor<CR>", desc = "Refactor" },
    { "<leader>as", "<cmd>CodexSummarize<CR>", desc = "Summarize file" },
  },
  { "<leader>am", group = "Change AI Model" },
  { "<leader>amn", function() SetCodexModel("gpt-5-nano") end, desc = "GPT-5 Nano – $0.05/1M input, $0.40/1M output" },
  { "<leader>amm", function() SetCodexModel("gpt-5-mini") end, desc = "GPT-5 Mini – $0.25/1M input, $2.00/1M output" },
  { "<leader>amc", function() SetCodexModel("gpt-5-codex") end, desc = "GPT-5 (Codex) – $1.25/1M input, $10.00/1M output" },
  
  -- 🧠 Quick Codex Chat Toggle
  { "<C-]>", function() require("codex").toggle() end, desc = "Toggle Codex Chat (persistent)" },  

  -- 💡 UltiSnips (Snippets)
  { "<leader>u", group = "Snippets (UltiSnips)" },
  { "<leader>use", ":UltiSnipsEdit<CR>", desc = "Edit snippet rules" },  

  -- 💬 Comments (NERDCommenter)
  { "<leader>c", group = "Comments" },
  { "<leader>cc", "<Plug>NERDCommenterComment", desc = "Comment line(s)", mode = { "n", "v" } },
  { "<leader>cu", "<Plug>NERDCommenterUncomment", desc = "Uncomment line(s)", mode = { "n", "v" } },
  { "<leader>c<space>", "<Plug>NERDCommenterToggle", desc = "Toggle comment", mode = { "n", "v" } },

  -- 🧮 Terminal (ToggleTerm + Conda runner)
  { "<leader>\\", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
  { "<leader>t", group = "Terminal" },
  { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Open vertical terminal split" },

  -- 🔍 Search / FZF
  { "<leader>f", group = "Search" },
  { "<leader>ff", ":Files<CR>", desc = "Find files" },
  { "<leader>fg", ":Rg<CR>", desc = "Grep" },
  { "<leader>fl", ":Lines<CR>", desc = "Search lines" },

  -- 🧠 LSP / Coc
  { "<leader>l", group = "LSP / Coc" },
  { "<leader>ld", "<Plug>(coc-definition)", desc = "Go to definition" },
  { "<leader>lr", "<Plug>(coc-references)", desc = "Find references" },
  { "<leader>lt", "<Plug>(coc-type-definition)", desc = "Type definition" },
  { "<leader>li", "<Plug>(coc-implementation)", desc = "Implementation" },
  { "<leader>lf", ":CocCommand python.setLinter<CR>", desc = "Set linter" },
  { "<leader>lp", ":CocCommand python.setInterpreter<CR>", desc = "Set interpreter" },

  -- 📚 Markdown preview
  { "<leader>m", group = "Markdown" },
  { "<leader>mp", ":MarkdownPreview<CR>", desc = "Preview" },
  { "<leader>ms", ":MarkdownPreviewStop<CR>", desc = "Stop preview" },
  { "<leader>mt", ":MarkdownPreviewToggle<CR>", desc = "Toggle preview" },

  -- 🧮 LaTeX (vimtex)
  { "<leader>x", group = "LaTeX (VimTeX)" },
  { "<leader>xx", ":VimtexCompile<CR>", desc = "Compile / Toggle build" },
  { "<leader>xe", ":VimtexErrors<CR>", desc = "View LaTeX errors" },
  { "<leader>xo", ":VimtexView<CR>", desc = "Open PDF viewer" },
  { "<leader>xs", ":VimtexStop<CR>", desc = "Stop compilation" },

  -- 🎨 Theme / UI
  { "<leader><F1>", ":TransparentToggle<CR>", desc = "Toggle transparency" },
  { "<leader>co", ":colorscheme tokyonight-night<CR>", desc = "Apply Tokyonight" },

  -- 🧮 Manim integration
  { "<leader>r", group = "Manim" },
  { "<leader>rl", ":lua RunManimScene('l')<CR>", desc = "Render (low quality)" },
  { "<leader>rh", ":lua RunManimScene('h')<CR>", desc = "Render (high quality)" },
  
  -- Codex model

})
