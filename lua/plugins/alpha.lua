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
            '██    ██                                        ',
            '███   ██                                          ',
            '███  ██  ████   ████  ██    ██ ██ ██████  ',
            '██ █ ██ █  █ █  █ ██    ██ ██ ██ ██ █ ',
            '██  ███ ████████ ██    ██ █  █ ██ ██  ██  ██ ',
            '██   ███ █      █  █  ██  ██ ██  ██  ██ ',
            '██    ██  ████   ████    ██   ██ ██  ██  ██ ',
        }
        -- {
        --     '888b    888                            d8b               ',
        --     '8888b   888                            Y8P               ',
        --     '88888b  888                                              ',
        --     '888Y88b 888  .d88b.   .d88b.  888  888 888 88888b.d88b.  ',
        --     '888 Y88b888 d8P  Y8b d88""88b 888  888 888 888 "888 "88b ',
        --     '888  Y88888 88888888 888  888 Y88  88P 888 888  888  888 ',
        --     '888   Y8888 Y8b.     Y88..88P  Y8bd8P  888 888  888  888 ',
        --     '888    Y888  "Y8888   "Y88P"    Y88P   888 888  888  888 ',
        -- }

        alpha.setup(theta.config)

        vim.keymap.set('n', '<Leader>a', [[:Alpha<CR>]], { desc = 'Dashboard' })
    end,
}
