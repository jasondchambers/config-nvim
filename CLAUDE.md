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
- `lua/jasondchambers/lazy.lua` — lazy.nvim bootstrap and setup (auto-discovers plugins from the plugins directory)
- `lua/jasondchambers/plugins/` — one file per plugin, each returning a lazy.nvim plugin spec table
- `lua/jasondchambers/plugins/init.lua` — base dependencies (plenary.nvim, vim-tmux-navigator)

**Plugin discovery:** lazy.nvim is configured with `require("lazy").setup("jasondchambers.plugins")`, which auto-discovers all `.lua` files in the plugins directory. To add a new plugin, create a new file in `lua/jasondchambers/plugins/` returning a lazy.nvim spec table.

## Key Conventions

- **Leader key is Space** — all custom keymaps use `<leader>` prefix
- **2-space indentation** everywhere (tabstop=2, shiftwidth=2, expandtab)
- Each plugin config file is self-contained: it returns a spec table and defines its own keymaps inside its `config` function
- Theme is tokyonight (night style) with custom color overrides in `theme.lua`
- Lualine statusline has a custom theme matching the tokyonight overrides

## Installed Plugins

tokyonight (theme), nvim-tree (file explorer `<leader>e_`), telescope (`<leader>f_`), treesitter, lualine, alpha (start screen), auto-session (`<leader>w_`), which-key, dressing, vim-maximizer (`<leader>wm`), vim-tmux-navigator, plenary, indent-blankline

## Commands

There is no build/test/lint system — this is a Neovim config. To test changes, open Neovim. To sync plugins after modifying specs:

```
nvim --headless "+Lazy sync" +qa
```

To check for Lua syntax errors:

```
luacheck lua/
```
