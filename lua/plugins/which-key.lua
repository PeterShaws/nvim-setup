return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
        local which_key = require('which-key')
        which_key.register({
            ['<Leader>b'] = { name = 'Buffer', _ = 'which_key_ignore' },
            ['<Leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
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
        which_key.register({
            ['<Leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
            ['<Leader>h'] = { name = 'Git Hunk', _ = 'which_key_ignore' },
            ['['] = { name = 'Previous', _ = 'which_key_ignore' },
            [']'] = { name = 'Next', _ = 'which_key_ignore' },
            ['i'] = { name = 'inside', _ = 'which_key_ignore' },
        }, { mode = 'v' })
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
