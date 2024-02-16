return {
    'famiu/bufdelete.nvim',
    config = function()
        vim.keymap.set('n', '<A-c>', [[:Bdelete<CR>]], {})
    end
}
