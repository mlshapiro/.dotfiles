return {
   {
      "nvim-treesitter/nvim-treesitter",
      cond = not vim.g.vscode,
      build = ":TSUpdate",
      config = function()
         local configs = require("nvim-treesitter.configs")
         configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "typescript" },
            highlight = {
               enable = true,
               additional_vim_regex_highlighting = false
            }
         })
      end
   },

   {
      "neovim/nvim-lspconfig",
      cond = not vim.g.vscode,
      event = BufPreRead,
      dependencies = {
         { "hrsh7th/nvim-cmp" },
         { "hrsh7th/cmp-nvim-lsp" },
      },

      config = function()
         -- Set up keyboard shortcuts
         vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
               local opts = { buffer = event.buf }
               vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
               vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
               vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
               vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
               vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
               vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
               vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
               vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
               vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
               vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end
         })

         local capabilities = require('cmp_nvim_lsp').default_capabilities()
         local config = require("lspconfig")

         -- Lua
         config.lua_ls.setup({
            capabilities = capabilities,
            settings = {
               Lua = {
                  runtime = {
                     version = 'LuaJIT'
                  },
                  diagnostics = {
                     globals = { 'vim' },
                  },
                  workspace = {
                     library = {
                        vim.env.VIMRUNTIME,
                     }
                  }
               }
            }
         })

         -- Typescript
         config.tsserver.setup({
            capabilities = capabilities,
         })

         -- Python
         -- Note: may need to set MYPYPATH for
         -- mypy to detect editable installs
         config.pylsp.setup({
            capabilities = capabilities,
            settings = {
               pylsp = {
                  plugins = {
                     black = { enabled = true },
                     mypy = { enabled = true },
                     ruff = { enabled = true },
                  }
               }
            }
         })
      end
   },

   {
      "hrsh7th/nvim-cmp",
      cond = not vim.g.vscode,
      event = { "InsertEnter", "CmdlineEnter" },
      dependencies = {
         { "hrsh7th/cmp-nvim-lsp" },
         { "hrsh7th/vim-vsnip" },
      },
      config = function()
         local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
         end

         local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
         end

         local cmp = require("cmp")

         cmp.setup({
            sources = {
               { name = "nvim_lsp" },
               { name = "nvim_lsp_signature_help"},
               { name = "vsnip" },
            },
            mapping = {
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
               ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
               ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.confirm({ select = true })
                  elseif vim.fn["vsnip#available"](1) == 1 then
                     feedkey("<Plug>(vsnip-expand-or-jump)", "")
                  elseif has_words_before() then
                     cmp.complete()
                  else
                     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                  end
               end, { "i", "s" }),
            },
            snippet = {
               expand = function(args)
                  vim.fn["vsnip#anonymous"](args.body)
               end
            }
         })
      end
   },

   { "hrsh7th/cmp-nvim-lsp", cond = not vim.g.vscode },
   { "hrsh7th/cmp-nvim-lsp-signature-help", cond = not vim.g.vscode },

   { "hrsh7th/vim-vsnip",    cond = not vim.g.vscode }
}
