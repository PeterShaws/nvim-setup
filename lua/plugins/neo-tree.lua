local map = function(keys, command, desc)
    vim.keymap.set('n', keys, command, { desc = desc })
end

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

        map('<F2>', [[:Neotree filesystem reveal left<CR>]], 'File explorer')
        map('<S-F2>', [[:Neotree close<CR>]], 'Close file explorer')
        vim.api.nvim_create_user_command('CloseNeotree', [[:Neotree close<CR>]], {})
    end,
}
