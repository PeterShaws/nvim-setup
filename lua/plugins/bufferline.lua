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
                            separator = true,
                            text_align = 'center',
                        },
                    },
                    indicator = {
                        style = 'none'
                    },
                },
            })

            local map = vim.keymap.set
            map('n', '<A-1>', [[:lua require('bufferline').go_to(1, true)<CR>]], { desc = 'Go to 1st buffer' })
            map('n', '<A-2>', [[:lua require('bufferline').go_to(2, true)<CR>]], { desc = 'Go to 2nd buffer' })
            map('n', '<A-3>', [[:lua require('bufferline').go_to(3, true)<CR>]], { desc = 'Go to 3rd buffer' })
            map('n', '<A-4>', [[:lua require('bufferline').go_to(4, true)<CR>]], { desc = 'Go to 4th buffer' })
            map('n', '<A-5>', [[:lua require('bufferline').go_to(5, true)<CR>]], { desc = 'Go to 5th buffer' })
            map('n', '<A-6>', [[:lua require('bufferline').go_to(6, true)<CR>]], { desc = 'Go to 6th buffer' })
            map('n', '<A-7>', [[:lua require('bufferline').go_to(7, true)<CR>]], { desc = 'Go to 7th buffer' })
            map('n', '<A-8>', [[:lua require('bufferline').go_to(8, true)<CR>]], { desc = 'Go to 8th buffer' })
            map('n', '<A-9>', [[:lua require('bufferline').go_to(9, true)<CR>]], { desc = 'Go to 9th buffer' })
            map('n', '<A-0>', [[:lua require('bufferline').go_to(-1, true)<CR>]], { desc = 'Go to last buffer' })
            map('n', '<A-p>', [[:BufferLinePick<CR>]], { desc = 'Pick open buffer' })
            map('n', '<A-h>', [[:BufferLineCyclePrev<CR>]], { desc = 'Go to previous buffer' })
            map('n', '<A-l>', [[:BufferLineCycleNext<CR>]], { desc = 'Go to next buffer' })
            map('n', '<A-O>', [[:BufferLineCloseOthers<CR>]], { desc = 'Close other buffers' })
            map('n', '<A-L>', [[:BufferLineCloseLeft<CR>]], { desc = 'Close buffers to the left' })
            map('n', '<A-R>', [[:BufferLineCloseRight<CR>]], { desc = 'Close buffers to the right' })
        end,
    },
    {
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<A-c>', [[:Bdelete<CR>]], { desc = 'Close current buffer' })
        end
    }
}
