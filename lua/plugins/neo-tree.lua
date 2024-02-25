local u = require('user.utils')

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
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                hijack_netrw_behavior = "open_default",
            }
        })

        u.map('n', '<F2>', [[:Neotree filesystem reveal left<CR>]], 'File explorer')
        u.map('n', '<F3>', [[:Neotree buffers reveal left<CR>]], 'Open Buffers')
        u.map('n', '<F4>', [[:Neotree git_status reveal left<CR>]], 'Git Status')
        u.map('n', '<S-F2>', [[:Neotree close<CR>]], 'Close file explorer')
        vim.api.nvim_create_user_command('CloseNeotree', [[:Neotree close<CR>]], {})
    end,
}
