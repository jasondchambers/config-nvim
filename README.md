# Neovim Configuration

Personal Neovim configuration written entirely in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Structure

```
init.lua                          # Entry point — loads core settings then plugins
lua/jasondchambers/
  core/
    init.lua                      # Requires options and keymaps
    options.lua                   # Editor options (2-space tabs, relative line numbers, dark theme, system clipboard)
    keymaps.lua                   # Leader key (Space) and custom keymaps
  lazy.lua                        # Bootstraps lazy.nvim; auto-discovers plugins from the plugins directory
  plugins/
    init.lua                      # Base dependencies (plenary.nvim, vim-tmux-navigator)
    alpha.lua                     # Start screen (startify theme)
    auto-session.lua              # Session save/restore
    dressing.lua                  # Improved UI select/input
    indent-blankline.lua          # Indent guides
    lualine.lua                   # Statusline with custom theme colors
    nvim-tree.lua                 # File explorer sidebar
    telescope.lua                 # Fuzzy finder (files, grep, buffers)
    theme.lua                     # Tokyonight (night) with custom color overrides
    treesitter.lua                # Syntax highlighting and parsing
    vim-maximizer.lua             # Toggle maximize for splits
    which-key.lua                 # Keymap hints popup
```

Load order: `init.lua` → `core` (options, keymaps) → `lazy.lua` (bootstrap + plugin discovery). Each plugin file in `plugins/` returns a lazy.nvim spec table and is auto-discovered.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Color scheme (night style with custom overrides) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, text, and buffers |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for Telescope |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and code parsing |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline with custom theme |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Start screen |
| [auto-session](https://github.com/rmagatti/auto-session) | Session management |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints popup |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim) | Improved UI for select and input |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [vim-maximizer](https://github.com/szw/vim-maximizer) | Toggle maximize/minimize splits |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless navigation between Neovim splits and tmux panes |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (dependency) |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons (dependency) |
| [mini.icons](https://github.com/nvim-mini/mini.icons) | Icon provider (dependency) |

## Keymapping Cheatsheet

Leader key is **Space**.

### General

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>+` | Normal | Increment number |
| `<leader>-` | Normal | Split window horizontally |

### Window Management

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>|` | Normal | Split window vertically |
| `<leader>-` | Normal | Split window horizontally |
| `<leader>c` | Normal | Close current split |
| `<leader>wm` | Normal | Maximize/minimize a split |

### File Explorer (nvim-tree)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>ee` | Normal | Toggle file explorer |
| `<leader>ef` | Normal | Toggle file explorer on current file |
| `<leader>ec` | Normal | Collapse file explorer |
| `<leader>er` | Normal | Refresh file explorer |

### Telescope (Fuzzy Finder)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>ff` | Normal | Find files in cwd |
| `<leader>fb` | Normal | Find open buffers |
| `<leader>fr` | Normal | Find recent files |
| `<leader>fg` | Normal | Live grep in cwd |
| `<leader>fc` | Normal | Find string under cursor in cwd |
| `<C-k>` | Insert (Telescope) | Move to previous result |
| `<C-j>` | Insert (Telescope) | Move to next result |
| `<C-q>` | Insert (Telescope) | Send selected to quickfix list |

### Session Management (auto-session)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>wr` | Normal | Restore session for cwd |
| `<leader>ws` | Normal | Save session for cwd |

### Tmux / Split Navigation (vim-tmux-navigator)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h>` | Normal | Navigate to left split / tmux pane |
| `<C-j>` | Normal | Navigate to bottom split / tmux pane |
| `<C-k>` | Normal | Navigate to top split / tmux pane |
| `<C-l>` | Normal | Navigate to right split / tmux pane |
