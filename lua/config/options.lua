-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
-- Hard wrap at 79 columns
vim.opt.textwidth = 79
vim.opt.formatoptions:append("t") -- auto-wrap text while typing
vim.opt.wrap = true -- still useful to see wraps while editing
vim.opt.linebreak = true -- break visually at word boundaries
