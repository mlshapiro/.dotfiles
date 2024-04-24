return {
   {
      'ggandor/leap.nvim',
      config = function()
         require("leap").create_default_mappings()
      end
   },

   {
      'nvim-telescope/telescope.nvim',
      cond = not vim.g.vscode,
      tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
         local builtin = require('telescope.builtin')
         vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
         vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
         vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
         vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
         vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, {})
         vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})
      end
   },

   {
      "folke/trouble.nvim",
      cond = not vim.g.vscode,
      config = function()
         require("trouble").setup({
            icons = false,
            fold_open = "v",
            fold_closed = ">",
            indent_lines = false,
            signs = {
               error = "error",
               warning = "warn",
               hint = "hint",
               information = "info"
            },
            use_diagnostic_signs = false
         })

         vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
         vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
         vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
         vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
         vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
         vim.keymap.set("n", "<leader>xr", function() require("trouble").toggle("lsp_references") end)
      end
   }
}
