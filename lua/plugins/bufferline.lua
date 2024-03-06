local u = require('user.utils')

return {
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('bufferline').setup({
                options = {
                    offsets = {
                        {
                            filetype = 'neo-tree',
                            text = 'Explorer',
                            highlight = 'Directory',
                            separator = false,
                            text_align = 'center',
                        },
                    },
                    indicator = { style = 'none' },
                    separator_style = "slope",
                    diagnostics = 'nvim_lsp',
                },
            })

            u.map('n', '<A-1>', [[:lua require('bufferline').go_to(1, true)<CR>]], 'Go to 1st buffer')
            u.map('n', '<A-2>', [[:lua require('bufferline').go_to(2, true)<CR>]], 'Go to 2nd buffer')
            u.map('n', '<A-3>', [[:lua require('bufferline').go_to(3, true)<CR>]], 'Go to 3rd buffer')
            u.map('n', '<A-4>', [[:lua require('bufferline').go_to(4, true)<CR>]], 'Go to 4th buffer')
            u.map('n', '<A-5>', [[:lua require('bufferline').go_to(5, true)<CR>]], 'Go to 5th buffer')
            u.map('n', '<A-6>', [[:lua require('bufferline').go_to(6, true)<CR>]], 'Go to 6th buffer')
            u.map('n', '<A-7>', [[:lua require('bufferline').go_to(7, true)<CR>]], 'Go to 7th buffer')
            u.map('n', '<A-8>', [[:lua require('bufferline').go_to(8, true)<CR>]], 'Go to 8th buffer')
            u.map('n', '<A-9>', [[:lua require('bufferline').go_to(9, true)<CR>]], 'Go to 9th buffer')
            u.map('n', '<A-0>', [[:lua require('bufferline').go_to(-1, true)<CR>]], 'Go to last buffer')
            u.map('n', '<A-p>', [[:BufferLinePick<CR>]], 'Pick open buffer')
            u.map('n', '<A-h>', [[:BufferLineCyclePrev<CR>]], 'Go to previous buffer')
            u.map('n', '<A-l>', [[:BufferLineCycleNext<CR>]], 'Go to next buffer')
            u.map('n', '<A-O>', [[:BufferLineCloseOthers<CR>]], 'Close other buffers')
            u.map('n', '<A-L>', [[:BufferLineCloseLeft<CR>]], 'Close buffers to the left')
            u.map('n', '<A-R>', [[:BufferLineCloseRight<CR>]], 'Close buffers to the right')
        end,
    },
    {
        'famiu/bufdelete.nvim',
        config = function()
            u.map('n', '<A-c>', [[:Bdelete<CR>]], 'Close current buffer')
        end
    }
}
