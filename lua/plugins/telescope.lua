local u = require('user.utils')

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                defaults = {
                    prompt_prefix = ' ',
                    selection_caret = ' ',
                    entry_prefix = '  ',
                    multi_icon = ' ',
                    winblend = 10,
                },
            })
            local builtin = require('telescope.builtin')
            u.map('n', '<Leader>ff', builtin.find_files, 'Find files')
            u.map('n', '<Leader>fg', builtin.live_grep, 'Live grep')
            u.map('n', '<Leader>fb', builtin.buffers, 'Open buffers')
            u.map('n', '<Leader>fh', builtin.help_tags, 'Help tags')
            u.map('n', '<Leader>fk', builtin.keymaps, 'Key maps')
            u.map('n', '<Leader>ft', builtin.treesitter, 'Treesitter symbols')
            u.map('n', '<Leader>fd', builtin.diagnostics, 'Diagnostics')
            u.map('n', '<Leader>f/', function()
                builtin.current_buffer_fuzzy_find(
                    require('telescope.themes').get_dropdown({ previewer = false })
                )
            end, 'Search current buffer')
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
