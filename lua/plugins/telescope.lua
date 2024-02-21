local map = function(keys, handler, desc)
    vim.keymap.set('n', keys, handler, { desc = desc })
end

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
                    winblend = 10,
                },
            })
            local builtin = require('telescope.builtin')
            map('<Leader>ff', builtin.find_files, 'Find files')
            map('<Leader>fg', builtin.live_grep, 'Live grep')
            map('<Leader>fb', builtin.buffers, 'Open buffers')
            map('<Leader>fh', builtin.help_tags, 'Help tags')
            map('<Leader>fk', builtin.keymaps, 'Key maps')
            map('<Leader>fc', builtin.colorscheme, 'Switch colorscheme')
            map('<Leader>ft', builtin.treesitter, 'Treesitter symbols')
            map('<Leader>fs', builtin.lsp_document_symbols, 'Document symbols')
            map('<Leader>fw', builtin.lsp_dynamic_workspace_symbols, 'Workspace symbols')
            map('<Leader>fd', builtin.diagnostics, 'Diagnostics')
            map('<Leader>f/', function()
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
