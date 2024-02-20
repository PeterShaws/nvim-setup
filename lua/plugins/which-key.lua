return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {
        icons = {
            breadcrumb = '',
            separator = '·',
            group = ' ',
        },
        window = {
            border = 'rounded',
            position = 'top',
            winblend = 10,
            zindex = 1000,
        },
    },
}
