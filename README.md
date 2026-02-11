# Neovim Configuration

Personal Neovim configuration written entirely in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

Based on [Josean's setup](https://www.josean.com/posts/how-to-setup-neovim-2024)
but modified to my taste and modernized (certain things weren't working in 2026 as Josean's blog post is from 2024).

Autocompletion (nvim-cmp), LSP (pyright), and Python debugging (nvim-dap + debugpy) are now configured.

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
    lazygit.lua                   # Lazygit integration
    lsp.lua                       # Mason, pyright, nvim-cmp autocompletion
    dap.lua                       # Python debugging (nvim-dap + debugpy + dap-ui)
    gitsigns.lua                  # Git gutter signs, hunk navigation/staging
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
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Lazygit integration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between Mason and lspconfig |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Python-specific DAP config (debugpy) |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Visual debugging UI |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs, hunk staging/navigation, blame |

## Keymapping Cheatsheet

Leader key is **Space**.

### General

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>+` | Normal | Increment number |
| `<leader>lg` | Normal | Launch Lazygit |

### Window Management

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>\|` | Normal | Split window vertically (Same as tmux) |
| `<leader>-` | Normal | Split window horizontally Same as tmux) |
| `<leader>x` | Normal | Close current split (Same as tmux) |
| `<leader>m` | Normal | Maximize/minimize a split (Same as tmux) |

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

### LSP (active when language server is attached)

| Keymap | Mode | Description |
|--------|------|-------------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Show references |
| `K` | Normal | Show hover info |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal/Visual | Code action |
| `<leader>d` | Normal | Show diagnostics float |
| `]d` | Normal | Next diagnostic |
| `[d` | Normal | Previous diagnostic |
| `<leader>td` | Normal | Toggle inline diagnostics |

### Debugging (nvim-dap)

The debugger auto-detects `.venv/bin/python` in the project root (for `uv`-managed projects), falling back to Mason's bundled debugpy. Make sure `debugpy` is installed in your venv: `uv pip install debugpy`.

When starting a debug session, select **"Launch file with arguments"** to pass command-line args (e.g. `Trimedx --verbose`).

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dB` | Normal | Set conditional breakpoint |
| `<leader>dc` | Normal | Start / continue debugging |
| `<leader>do` | Normal | Step over |
| `<leader>di` | Normal | Step into |
| `<leader>dO` | Normal | Step out |
| `<leader>dr` | Normal | Restart debugging |
| `<leader>dx` | Normal | Terminate debugging |
| `<leader>du` | Normal | Toggle debug UI |

### Git Signs (gitsigns.nvim)

| Keymap | Mode | Description |
|--------|------|-------------|
| `]h` | Normal | Next git hunk |
| `[h` | Normal | Previous git hunk |
| `<leader>gp` | Normal | Preview hunk |
| `<leader>gs` | Normal | Stage hunk |
| `<leader>gr` | Normal | Reset hunk |
| `<leader>gb` | Normal | Blame line |

### Tmux / Split Navigation (vim-tmux-navigator)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h>` | Normal | Navigate to left split / tmux pane |
| `<C-j>` | Normal | Navigate to bottom split / tmux pane |
| `<C-k>` | Normal | Navigate to top split / tmux pane |
| `<C-l>` | Normal | Navigate to right split / tmux pane |
