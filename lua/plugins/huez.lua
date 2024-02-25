local u = require('user.utils')

return {
    'vague2k/huez.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
        require('huez').setup({
            picker = 'telescope',
            picker_opts = require('telescope.themes').get_dropdown({}),
        })

        local colorscheme = require('huez.api').get_colorscheme()
        vim.cmd.colorscheme(colorscheme)

        u.map('n', '<Leader>fc', [[:Huez<CR>]], 'Colorschemes')
    end
}
