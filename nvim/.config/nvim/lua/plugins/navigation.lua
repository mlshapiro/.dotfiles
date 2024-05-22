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

            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close
                        },
                    },
                },
                pickers = {
                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    }
                }
            })
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
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        cond = not vim.g.vscode,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window
        },
        config = function()
            -- Set shortcut to toggle
            vim.keymap.set("n", "<leader>bb", "<Cmd>Neotree toggle<CR>")

            -- Add source selector
            require("neo-tree").setup({
                close_if_last_window = true,
                filesystem = {
                    hijack_netrw_behavior = "open_current",
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_gitignored = true,
                        hide_hidden = false,
                        never_show = { ".git" },
                    }
                },
                source_selector = {
                    winbar = false,
                    statusline = false
                },
                sources = {
                    "filesystem",
                    "buffers",
                    "git_status",
                    "document_symbols",
                },
            })
        end
    },
    {
        'romgrk/barbar.nvim',
        cond = not vim.g.vscode,
        version = '^1.0.0',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false

            -- Move to previous/next
            vim.keymap.set('n', '<leader>,', '<Cmd>BufferPrevious<CR>')
            vim.keymap.set('n', '<leader>.', '<Cmd>BufferNext<CR>')

            -- Re-order to previous/next
            vim.keymap.set('n', '<leader><', '<Cmd>BufferMovePrevious<CR>')
            vim.keymap.set('n', '<leader>>', '<Cmd>BufferMoveNext<CR>')

            -- Goto buffer in position...
            vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>')
            vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>')
            vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>')
            vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>')
            vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>')
            vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>')
            vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>')
            vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>')
            vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>')
            vim.keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>')

            -- Pin/unpin buffer
            vim.keymap.set('n', '<leader>p', '<Cmd>BufferPin<CR>')

            -- Close buffer
            vim.keymap.set('n', '<leader>cc', '<Cmd>BufferClose<CR>')
            vim.keymap.set('n', '<leader>ca', '<Cmd>BufferCloseAllButCurrent<CR>')
            vim.keymap.set('n', '<leader>cp', '<Cmd>BufferCloseAllButPinned<CR>')
            vim.keymap.set('n', '<leader>cr', '<Cmd>BufferCloseBuffersRight<CR>')
            vim.keymap.set('n', '<leader>cl', '<Cmd>BufferCloseBuffersLeft<CR>')

            -- Magic buffer-picking mode
            -- vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>')

            -- Sort automatically by...
            vim.keymap.set('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>')
            vim.keymap.set('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>')
            vim.keymap.set('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>')
            vim.keymap.set('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>')
        end,
        opts = {
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        }
    },
    {
        "coffebar/neovim-project",
        lazy = false,
        priority = 100,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
            { "Shatur/neovim-session-manager" },
        },
        opts = {
            projects = {
                "~/computing/contrailcirrus/*",
                "~/computing/mlshapiro/*",
                "~/computing/mlshapiro/.dotfiles",
            }
        },
        init = function()
            -- enable saving the state of plugins in the session
            vim.opt.sessionoptions:append("globals")

            -- Set shortcut to toggle
            vim.keymap.set("n", "<leader>fp", "<Cmd>Telescope neovim-project discover<CR>")
            vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope neovim-project history<CR>")
        end
    }
}
