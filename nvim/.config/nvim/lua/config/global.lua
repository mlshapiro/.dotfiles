-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

   -- navigation between windows
   vim.keymap.set("n", "<C-Left>", "<C-w><Left>")
   vim.keymap.set("n", "<C-Right>", "<C-w><Right>")
   vim.keymap.set("n", "<C-Up>", "<C-w><Up>")
   vim.keymap.set("n", "<C-Down>", "<C-w><Down>")
end
