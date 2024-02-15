return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('bufferline').setup({
            options = {
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'File Explorer',
                        highlight = 'Directory',
                        separator = true,
                        text_align = 'center',
                    },
                },
            },
        })

        local map = vim.keymap.set
        map('n', '<A-1>', [[:lua require('bufferline').go_to(1, true)<CR>]], {})
        map('n', '<A-2>', [[:lua require('bufferline').go_to(2, true)<CR>]], {})
        map('n', '<A-3>', [[:lua require('bufferline').go_to(3, true)<CR>]], {})
        map('n', '<A-4>', [[:lua require('bufferline').go_to(4, true)<CR>]], {})
        map('n', '<A-5>', [[:lua require('bufferline').go_to(5, true)<CR>]], {})
        map('n', '<A-6>', [[:lua require('bufferline').go_to(6, true)<CR>]], {})
        map('n', '<A-7>', [[:lua require('bufferline').go_to(7, true)<CR>]], {})
        map('n', '<A-8>', [[:lua require('bufferline').go_to(8, true)<CR>]], {})
        map('n', '<A-9>', [[:lua require('bufferline').go_to(9, true)<CR>]], {})
        map('n', '<A-0>', [[:lua require('bufferline').go_to(-1, true)<CR>]], {})
        map('n', '<A-p>', [[:BufferLinePick<CR>]], {})
        map('n', '<A-h>', [[:BufferLineCyclePrev<CR>]], {})
        map('n', '<A-l>', [[:BufferLineCycleNext<CR>]], {})
        map('n', '<A-c>', [[:bdelete<CR>]], {})
        map('n', '<A-O>', [[:BufferLineCloseOthers<CR>]], {})
        map('n', '<A-L>', [[:BufferLineCloseLeft<CR>]], {})
        map('n', '<A-R>', [[:BufferLineCloseRight<CR>]], {})
    end,
}
