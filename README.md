# Neovim Config

A deeply customized Neovim environment.
It integrates tools like Codex, and various niceties like a floating terminal easily accessed with key-bindings.

## Features
- Plugin Management – via lazy.nvim
- LSP + Completion – coc.nvim
- AI Assistant – codex.nvim
 (OpenAI Codex integration)
- Contextual Keymaps – which-key.nvim
- Git Tools – vim-fugitive
, vim-gitgutter
- Navigation & Editing – NERDTree, vim-surround, multiple cursors, etc.
- Snippets – ultisnips
- LaTeX + Markdown – vimtex
, markdown-preview.nvim
- Floating Terminal – toggleterm.nvim
 mapped to <kbd>Ctrl</kbd>+<kbd>\</kbd>
- Undo Persistence – custom undodir (Git-ignored for cleanliness)

## Installation
1. Clone this repository
git clone git@github.com:alexandre-youruser/nvim-config.git ~/github/nvim-config

2. Create the symbolic link
ln -s ~/github/nvim-config/nvim ~/.config/nvim

3. Start Neovim
nvim

Lazy.nvim will automatically install all plugins on first launch.

## Some useful Keybindings
Category	Shortcut	Action
File Tree	<leader>nt	Toggle NERDTree
Terminal	<C-\>	Toggle floating terminal
AI (Codex)	<C-]>	Toggle Codex chat (persistent)
	<leader>amn / amm / amc	Switch Codex models (Nano, Mini, Codex)
LSP / CoC	<Tab> / <S-Tab>	Navigate completions or indent properly
	[g / ]g	Navigate diagnostics
	gd, gy, gi, gr	GoTo definition, type, implementation, references
Snippets (UltiSnips)	<leader><tab>	Expand snippet
	<leader>use	Edit snippet file (vertical split)
Comments	<leader>cc / <leader>cu	Comment / uncomment code
VimTeX	<leader>xx	Toggle compile
	<leader>xe	Show error log
Transparency	<leader>tb	Toggle background transparency
Clipboard	<leader>y / <leader>p	Yank / paste to system clipboard

(full mappings available via Which-Key with <leader>, which is set to <space> by default)

## Folder Structure
nvim/
├── init.lua               # main entry
├── lua/
│   ├── plugins/           # plugin definitions for lazy.nvim
│   ├── config/            # per-module configs (coc, which-key, ui, etc.)
│   ├── utils.lua          # helper functions
│   └── coc.lua            # CoC keymaps & logic
├── undodir/               # undo history (ignored by git)
│   └── .gitignore
└── README.md

## License
MIT — freely reusable and adaptable.
