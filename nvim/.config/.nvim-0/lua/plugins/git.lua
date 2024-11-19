return {
    {
        "lewis6991/gitsigns.nvim",
        cond = not vim.g.vscode,
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 250,
                    virt_text_pos = 'eol' --'right_align',
                },
                current_line_blame_formatter = '<author> • <author_time:%Y %b %d> • <summary>',

                -- Mappings on attach
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    -- Navigation
                    vim.keymap.set('n', ']g', function()
                        if vim.wo.diff then
                            vim.cmd.normal({']g', bang = true})
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    vim.keymap.set('n', '[g', function()
                        if vim.wo.diff then
                            vim.cmd.normal({'[g', bang = true})
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
                    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
                    vim.keymap.set('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    vim.keymap.set('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                    vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer)
                    vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk)
                    vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer)
                    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
                    vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                    vim.keymap.set('n', '<leader>hd', gitsigns.diffthis)
                    vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                    vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted)
                    vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)

                    -- Text object
                    vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })
        end
    }
}
