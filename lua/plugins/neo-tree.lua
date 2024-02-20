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

        vim.keymap.set('n', '<F2>', [[:Neotree filesystem reveal left<CR>]], { desc = 'File explorer' })
        vim.keymap.set('n', '<S-F2>', [[:Neotree close<CR>]], { desc = 'Close file explorer' })
        vim.api.nvim_create_user_command('CloseNeotree', [[:Neotree close<CR>]], {})
    end,
}
