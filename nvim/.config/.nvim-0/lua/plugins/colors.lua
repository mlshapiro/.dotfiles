return {
   {
      "rebelot/kanagawa.nvim",
      cond = not vim.g.vscode,
      lazy = false,
      priority = 1000,
      config = function()
         require("kanagawa").setup({})
         vim.cmd.colorscheme("kanagawa-wave")
         -- vim.cmd.colorscheme("kanagawa-dragon")
         -- vim.cmd.colorscheme("kanagawa-lotus")
         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
         vim.api.nvim_set_hl(0, "NormalFloat", { link = "Pmenu" })
         vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "gray" })
         vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
         vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
         vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
         vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
         vim.api.nvim_set_hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
      end
   }
}
