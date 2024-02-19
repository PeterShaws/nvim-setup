return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')
        configs.setup({
            ensure_installed = {
                'lua',
                'vim',
                'vimdoc',
                'javascript',
                'typescript',
                'html',
                'css',
                'python',
                'bash'
            },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
        })

        vim.opt.foldmethod = 'expr'                     -- Define code folding method
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Tree-Sitter for code folding
        vim.opt.foldenable = false                      -- Don't fold code by default
    end,
}
