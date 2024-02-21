return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
        require('which-key').register({
            ['<Leader>b'] = { name = 'Buffer', _ = 'which_key_ignore' },
            ['<Leader>c'] = { name = 'Change', _ = 'which_key_ignore' },
            ['<Leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
            ['<Leader>h'] = { name = 'Git Hunk', _ = 'which_key_ignore' },
            ['<Leader>q'] = { name = 'Quit', _ = 'which_key_ignore' },
            ['<Leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
            ['<Leader>t'] = { name = 'Toggle', _ = 'which_key_ignore' },
            ['<Leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
            ['<Leader>x'] = { name = 'Trouble', _ = 'which_key_ignore' },
            ['['] = { name = 'Previous', _ = 'which_key_ignore' },
            [']'] = { name = 'Next', _ = 'which_key_ignore' },
        })
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
