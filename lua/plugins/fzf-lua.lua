local u = require("user.utils")

return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- calling `setup` is optional for customization
        require('fzf-lua').setup({})

        u.map('n', '<C-\\>', [[:FzfLua buffers<cr>]], 'FZF: Buffers')
        u.map('n', '<C-g>', [[:FzfLua grep<cr>]], 'FZF: Grep')
        u.map('n', '<C-p>', [[:FzfLua files<cr>]], 'FZF: Files')
        u.map('n', '<C-i>', [[:FzfLua live_grep<cr>]], 'FZF: Live grep')
    end
}
