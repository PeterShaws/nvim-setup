return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')
        configs.setup({
            modules = {},
            ensure_installed = {
                'bash',
                'css',
                'html',
                'javascript',
                'lua',
                'markdown',
                'markdown_inline',
                'python',
                'typescript',
                'vim',
                'vimdoc',
            },
            auto_install = true,
            sync_install = false,
            ignore_install = {},
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["gj"] = "@function.outer",
                        ["]]"] = "@class.outer",
                        ["]b"] = "@block.outer",
                        ["]a"] = "@parameter.inner",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["gJ"] = "@function.outer",
                        ["]["] = "@class.outer",
                        ["]B"] = "@block.outer",
                        ["]A"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["gk"] = "@function.outer",
                        ["[["] = "@class.outer",
                        ["[b"] = "@block.outer",
                        ["[a"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["gK"] = "@function.outer",
                        ["[]"] = "@class.outer",
                        ["[B"] = "@block.outer",
                        ["[A"] = "@parameter.inner",
                    },
                },
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['ab'] = '@block.outer',
                        ['ib'] = '@block.inner',
                        ['al'] = '@loop.outer',
                        ['il'] = '@loop.inner',
                        ['a/'] = '@comment.outer',
                        ['i/'] = '@comment.outer',   -- no inner comment
                        ['aa'] = '@parameter.outer', -- argument = parameter
                        ['ia'] = '@parameter.inner',
                    },
                },
            },
        })

        vim.opt.foldmethod = 'expr'                     -- Define code folding method
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Tree-Sitter for code folding
        vim.opt.foldenable = false                      -- Don't fold code by default
    end,
}
