return {
    'lewis6991/gitsigns.nvim',
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local map = function(mode, keys, handler, desc)
                vim.keymap.set(mode, keys, handler, {
                    buffer = bufnr, desc = desc, silent = true
                })
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = 'Next changed hunk' })

            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = 'Previous changed hunk' })

            -- Actions
            map('n', '<Leader>hs', gs.stage_hunk, 'Stage hunk')
            map('n', '<Leader>hr', gs.reset_hunk, 'Reset hunk')
            map('v', '<Leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage hunk')
            map('v', '<Leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Reset hunk')
            map('n', '<Leader>hS', gs.stage_buffer, 'Stage buffer')
            map('n', '<Leader>hu', gs.undo_stage_hunk, 'Unstage hunk')
            map('n', '<Leader>hR', gs.reset_buffer, 'Reset buffer')
            map('n', '<Leader>hp', gs.preview_hunk, 'Preview hunk')
            map('n', '<Leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
            map('n', '<Leader>tb', gs.toggle_current_line_blame, 'Toggle current line blame')
            map('n', '<Leader>hd', gs.diffthis, 'Compare to base')
            map('n', '<Leader>hD', function() gs.diffthis('~') end, 'Compare to last commit')
            map('n', '<Leader>td', gs.toggle_deleted, 'Toggle deleted')

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk')
        end,
    },
}
