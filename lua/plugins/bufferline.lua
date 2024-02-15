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
                        text_align = 'center'
                    }
                }
            }
        })
        vim.keymap.set('n', '<A-1>', [[:lua require('bufferline').go_to(1, true)<CR>]], {})
        vim.keymap.set('n', '<A-2>', [[:lua require('bufferline').go_to(2, true)<CR>]], {})
        vim.keymap.set('n', '<A-3>', [[:lua require('bufferline').go_to(3, true)<CR>]], {})
        vim.keymap.set('n', '<A-4>', [[:lua require('bufferline').go_to(4, true)<CR>]], {})
        vim.keymap.set('n', '<A-5>', [[:lua require('bufferline').go_to(5, true)<CR>]], {})
        vim.keymap.set('n', '<A-6>', [[:lua require('bufferline').go_to(6, true)<CR>]], {})
        vim.keymap.set('n', '<A-7>', [[:lua require('bufferline').go_to(7, true)<CR>]], {})
        vim.keymap.set('n', '<A-8>', [[:lua require('bufferline').go_to(8, true)<CR>]], {})
        vim.keymap.set('n', '<A-9>', [[:lua require('bufferline').go_to(9, true)<CR>]], {})
        vim.keymap.set('n', '<A-0>', [[:lua require('bufferline').go_to(-1, true)<CR>]], {})
        vim.keymap.set('n', '<A-p>', [[:BufferLinePick<CR>]], {})
        vim.keymap.set('n', '<A-h>', [[:BufferLineCyclePrev<CR>]], {})
        vim.keymap.set('n', '<A-l>', [[:BufferLineCycleNext<CR>]], {})
        vim.keymap.set('n', '<A-c>', [[:bdelete<CR>]], {})
        vim.keymap.set('n', '<A-O>', [[:BufferLineCloseOthers<CR>]], {})
        vim.keymap.set('n', '<A-L>', [[:BufferLineCloseLeft<CR>]], {})
        vim.keymap.set('n', '<A-R>', [[:BufferLineCloseRight<CR>]], {})
    end,
}
