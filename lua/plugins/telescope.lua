return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    prompt_prefix = ' ',
                    selection_caret = ' ',
                    entry_prefix = '  ',
                    multi_icon = ' ',
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<Leader>fc', builtin.colorscheme, {})
            vim.keymap.set('n', '<Leader>ft', builtin.treesitter, {})
            vim.keymap.set('n', '<Leader>fd', builtin.diagnostics, {})
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown({}),
                    },
                },
            })
            telescope.load_extension('ui-select')
        end,
    },
}
