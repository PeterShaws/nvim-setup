return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify'
    },
    config = function()
        local noice = require('noice')
        noice.setup({
            cmdline = {
                format = {
                    cmdline = { icon = '' },
                    search_down = { icon = ' ' },
                    search_up = { icon = ' ' },
                    filter = { icon = '' },
                    lua = { icon = '' },
                    help = { icon = '󰘥' },
                    input = {},
                },
            },
            presets = {
                command_palette = true,
            },
        })
        require('lualine').setup({
            sections = {
                lualine_x = {
                    {
                        noice.api.statusline.mode.get,
                        cond = noice.api.statusline.mode.has,
                        color = { fg = '#ff9e64' }
                    },
                    'encoding', 'fileformat', 'filetype'
                }
            }
        })
        require('telescope').load_extension('noice')
        vim.keymap.set('n', '<Leader>fm', [[:Telescope noice<CR>]], { desc = 'List messages' })
    end,
}
