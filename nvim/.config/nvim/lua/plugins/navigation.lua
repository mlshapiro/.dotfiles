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
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window
        },
        config = function()
            -- Set shortcut to toggle
            vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>")

            -- Add source selector
            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        --visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = true,
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
        version = '^1.0.0',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() 
            vim.g.barbar_auto_setup = false 
        end,
        opts = {
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
    },
}
