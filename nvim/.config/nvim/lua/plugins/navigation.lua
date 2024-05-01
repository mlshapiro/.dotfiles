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
            vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>")

            -- Add source selector
            require("neo-tree").setup({
                close_if_last_window = true,
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
            vim.keymap.set('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
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
        'gnikdroy/projections.nvim',
        branch = 'pre_release',
        config = function()
            require("projections").setup({
                workspaces = {
                    "~/computing/contrailcirrus/*",
                    "~/computing/mlshapiro/*",
                    "~/computing/mlshapiro/.dotfiles",
                },
                -- patterns = { ".git", ".svn", ".hg" },      -- Default patterns to use if none were specified. These are NOT regexps.
                -- store_hooks = { pre = nil, post = nil },   -- pre and post hooks for store_session, callable | nil
                -- restore_hooks = { pre = nil, post = nil }, -- pre and post hooks for restore_session, callable | nil
                workspaces_file = "~/.local/share/nvim/projection.json", -- Path to workspaces json file
                sessions_directory = "~/.local/share/nvim/projection",   -- Directory where sessions are stored
            })

            -- Bind <leader>fp to Telescope projections
            require('telescope').load_extension('projections')
            vim.keymap.set("n", "<leader>fp", function() vim.cmd("Telescope projections") end)

            -- Autostore session on VimExit
            local Session = require("projections.session")
            vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
                callback = function() Session.store(vim.loop.cwd()) end,
            })

            -- Switch to project if vim was started in a project dir, restore session
            local switcher = require("projections.switcher")
            vim.api.nvim_create_autocmd({ "VimEnter" }, {
                callback = function()
                    if vim.fn.argc() ~= 0 then return end
                    local session_info = Session.info(vim.loop.cwd())
                    if session_info == nil then
                        Session.restore_latest()
                    else
                        Session.restore(vim.loop.cwd())
                    end
                end,
                desc = "Restore last session automatically"
            })
        end,

    }
}
