local map = require("user.utils").map

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
                    separator_style = 'thin',
                    diagnostics = 'nvim_lsp',
                },
            })

            for i = 1, 9 do
                local keys = string.format('<A-%d>', i)
                local command = string.format([[:lua require('bufferline').go_to(%d, true)<CR>]], i)
                local desc = string.format('Focus buffer #%d', i)
                map('n', keys, command, desc)
            end

            map('n', '<A-p>', [[:BufferLinePick<CR>]], 'Pick open buffer')
            map('n', '<A-h>', [[:BufferLineCyclePrev<CR>]], 'Go to previous buffer')
            map('n', '<A-l>', [[:BufferLineCycleNext<CR>]], 'Go to next buffer')
            map('n', '<A-O>', [[:BufferLineCloseOthers<CR>]], 'Close other buffers')
            map('n', '<A-L>', [[:BufferLineCloseLeft<CR>]], 'Close buffers to the left')
            map('n', '<A-R>', [[:BufferLineCloseRight<CR>]], 'Close buffers to the right')
        end,
    },
    {
        'famiu/bufdelete.nvim',
        config = function()
            map('n', '<A-c>', [[:Bdelete<CR>]], 'Close current buffer')
        end
    }
}
