local map = require('user.utils').map

return {
    'voldikss/vim-floaterm',
    config = function()
        vim.g.floaterm_width = 0.92
        vim.g.floaterm_height = 0.92
        vim.g.floaterm_borderchars = '─│─│╭╮╯╰'

        map('n', '<F12>', [[:FloatermToggle<CR>]], 'Toggle floating terminal')
        map('t', '<F12>', [[:FloatermToggle<CR>]], 'Toggle floating terminal')
    end,
}
