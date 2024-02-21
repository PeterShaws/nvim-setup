local map = function(keys, command, desc)
    vim.keymap.set('n', keys, command, { desc = desc })
end

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
                    indicator = { style = 'none' },
                    diagnostics = 'nvim_lsp',
                },
            })

            map('<A-1>', [[:lua require('bufferline').go_to(1, true)<CR>]], 'Go to 1st buffer')
            map('<A-2>', [[:lua require('bufferline').go_to(2, true)<CR>]], 'Go to 2nd buffer')
            map('<A-3>', [[:lua require('bufferline').go_to(3, true)<CR>]], 'Go to 3rd buffer')
            map('<A-4>', [[:lua require('bufferline').go_to(4, true)<CR>]], 'Go to 4th buffer')
            map('<A-5>', [[:lua require('bufferline').go_to(5, true)<CR>]], 'Go to 5th buffer')
            map('<A-6>', [[:lua require('bufferline').go_to(6, true)<CR>]], 'Go to 6th buffer')
            map('<A-7>', [[:lua require('bufferline').go_to(7, true)<CR>]], 'Go to 7th buffer')
            map('<A-8>', [[:lua require('bufferline').go_to(8, true)<CR>]], 'Go to 8th buffer')
            map('<A-9>', [[:lua require('bufferline').go_to(9, true)<CR>]], 'Go to 9th buffer')
            map('<A-0>', [[:lua require('bufferline').go_to(-1, true)<CR>]], 'Go to last buffer')
            map('<A-p>', [[:BufferLinePick<CR>]], 'Pick open buffer')
            map('<A-h>', [[:BufferLineCyclePrev<CR>]], 'Go to previous buffer')
            map('<A-l>', [[:BufferLineCycleNext<CR>]], 'Go to next buffer')
            map('<A-O>', [[:BufferLineCloseOthers<CR>]], 'Close other buffers')
            map('<A-L>', [[:BufferLineCloseLeft<CR>]], 'Close buffers to the left')
            map('<A-R>', [[:BufferLineCloseRight<CR>]], 'Close buffers to the right')
        end,
    },
    {
        'famiu/bufdelete.nvim',
        config = function()
            map('<A-c>', [[:Bdelete<CR>]], 'Close current buffer')
        end
    }
}
