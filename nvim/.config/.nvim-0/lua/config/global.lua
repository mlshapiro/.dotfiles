-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use the system clipboard for copy/paste
vim.opt.clipboard="unnamed,unnamedplus"

-- tabs as 4 spaces  
local tabsize = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize

if not vim.g.vscode then
   -- proper colors
   vim.opt.termguicolors = true
   -- vim.cmd("colorscheme predawn")

   -- line numbers
   vim.opt.number = true
   vim.opt.signcolumn = "yes:1"

   -- better indentation
   vim.opt.smartindent = true
   vim.opt.breakindent = true

   -- autowrite
   vim.opt.autowriteall = false

end
