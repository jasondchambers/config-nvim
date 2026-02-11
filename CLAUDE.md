# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal Neovim configuration for `jasondchambers`, written entirely in Lua. Uses **lazy.nvim** as the plugin manager.

## Architecture

**Entry point:** `init.lua` loads two modules in order:
1. `jasondchambers.core` — editor options and keymaps
2. `jasondchambers.lazy` — bootstraps lazy.nvim, then loads all plugins from `jasondchambers.plugins`

**Directory layout:**
- `lua/jasondchambers/core/options.lua` — vim options (tabs=2 spaces, relative line numbers, dark theme, system clipboard)
- `lua/jasondchambers/core/keymaps.lua` — leader key (`<Space>`) and custom keymaps
- `lua/jasondchambers/lazy.lua` — lazy.nvim bootstrap and setup
- `lua/jasondchambers/plugins/` — one file per plugin, each returning a lazy.nvim plugin spec table
- `lua/jasondchambers/plugins/init.lua` — base dependencies (plenary.nvim, vim-tmux-navigator)

**Plugin discovery:** lazy.nvim is configured with `require("lazy").setup("jasondchambers.plugins")`, which auto-discovers all `.lua` files in the plugins directory. To add a new plugin, create a new file in `lua/jasondchambers/plugins/` returning a lazy.nvim spec table.

Ignore the `old/` folder.

## Key Conventions

- **Leader key is Space** — all custom keymaps use `<leader>` prefix
- **2-space indentation** everywhere (tabstop=2, shiftwidth=2, expandtab)
- Each plugin config file is self-contained: it returns a spec table and defines its own keymaps inside its `config` function
- Theme is tokyonight (night style) with custom color overrides in `theme.lua`
- Lualine statusline has a custom theme matching the tokyonight overrides

## Installed Plugins

- **UI:** tokyonight (theme), lualine (statusline), alpha (start screen), dressing, indent-blankline, which-key
- **Navigation:** nvim-tree (`<leader>e`), telescope (`<leader>f`), vim-tmux-navigator, vim-maximizer (`<leader>wm`)
- **Session:** auto-session (`<leader>w`)
- **Git:** lazygit (`<leader>lg`)
- **LSP:** mason + mason-lspconfig (installer), pyright (Python), nvim-cmp + cmp-nvim-lsp (completion), LuaSnip (snippets)
- **Debugging:** nvim-dap + nvim-dap-python + nvim-dap-ui (`<leader>d`)
- **Core:** plenary, treesitter, nvim-nio

## Python Development Setup

LSP uses **pyright** via Mason. Debugging uses **debugpy** via nvim-dap-python.

**DAP Python resolution:** The debugger auto-detects `.venv/bin/python` in the project root (for `uv`-managed projects). Falls back to Mason's bundled debugpy. Projects using `uv` need `debugpy` installed in the venv: `uv pip install debugpy`.

**Passing arguments during debugging:** Select "Launch file with arguments" when starting a debug session (`<leader>dc`) and enter args at the prompt (e.g. `Trimedx --verbose`).

## LSP Keymaps (active when LSP is attached)

`gd` definition, `gD` declaration, `gr` references, `K` hover, `<leader>rn` rename, `<leader>ca` code action, `<leader>d` diagnostics float, `]d`/`[d` next/prev diagnostic

## Commands

There is no build/test/lint system — this is a Neovim config. To test changes, open Neovim. To sync plugins after modifying specs:

```
nvim --headless "+Lazy sync" +qa
```

To check for Lua syntax errors:

```
luacheck lua/
```
