-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options
vim.opt.relativenumber = false -- Turn off relative line numbers

-- Python options
vim.g.lazyvim_python_lsp = "mypy" -- "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

