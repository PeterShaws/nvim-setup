return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local alpha = require('alpha')
        local theta = require('alpha.themes.theta')

        theta.header.val = {
            [[                                                ]],
            [[██   ██                                          ]],
            [[███  ██  ████   ████  ██    ██ ██ ████  ]],
            [[███ ██ █  █ █  █ ██    ██ ██ █████ ]],
            [[██ ███ ████████ ██    ██ █  █ ██ ██  ██  ██ ]],
            [[██  ███ █      █  █  ██  ██ ██  ██  ██ ]],
            [[██   ██  ████   ████    ██   ██ ██  ██  ██ ]],
        }

        alpha.setup(theta.config)

        vim.keymap.set('n', '<Leader>a', [[:Alpha<CR>]], { desc = 'Dashboard' })
    end,
}
