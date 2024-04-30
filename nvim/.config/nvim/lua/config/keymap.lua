
if not vim.g.vscode then

    -- Navigation between windows
    vim.keymap.set("n", "<C-Left>", "<C-w><Left>")
    vim.keymap.set("n", "<C-Right>", "<C-w><Right>")
    vim.keymap.set("n", "<C-Up>", "<C-w><Up>")
    vim.keymap.set("n", "<C-Down>", "<C-w><Down>")

end
