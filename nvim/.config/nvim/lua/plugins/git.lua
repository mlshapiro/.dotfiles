return {
   {
      "f-person/git-blame.nvim",
      cond = not vim.g.vscode,
      config = function()
         require("gitblame").setup({
            date_format = "%d %b %Y (%a)"
         })
      end
   }
}
