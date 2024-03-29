local map = require('user.utils').map

return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        's1n7ax/nvim-window-picker',
    },
    config = function()
        require('neo-tree').setup({
            sources = {
                'filesystem',
                'git_status',
                'document_symbols'
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                hijack_netrw_behavior = 'open_default',
            },
            git_status = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
            },
            document_symbols = {},
            source_selector = {
                winbar = true,
                sources = {
                    { source = 'filesystem' },
                    { source = 'git_status' },
                    { source = 'document_symbols' }
                },
                content_layout = 'center',
                tabs_layout = 'equal',
                separator = { left = '▏', right = '▕' },
            }
        })

        map('n', '<F2>', [[:Neotree filesystem reveal left<CR>]], 'File explorer')
        map('n', '<F3>', [[:Neotree git_status reveal left<CR>]], 'Git Status')
        map('n', '<F4>', [[:Neotree document_symbols reveal left<CR>]], 'Document Symbols')
        map('n', '<S-F2>', [[:Neotree close<CR>]], 'Close file explorer')
        vim.api.nvim_create_user_command('CloseNeotree', [[:Neotree close<CR>]], {})
    end,
}
