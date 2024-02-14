return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<Leader>fc', builtin.colorscheme, {})
        vim.keymap.set('n', '<Leader>ft', builtin.treesitter, {})
    end
}
