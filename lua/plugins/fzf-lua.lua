local map = require('user.utils').map

return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- calling `setup` is optional for customization
        require('fzf-lua').setup({})

        map('n', '<C-\\>', [[:FzfLua buffers<cr>]], 'FZF: Buffers')
        map('n', '<C-g>', [[:FzfLua grep<cr>]], 'FZF: Grep')
        map('n', '<C-p>', [[:FzfLua files<cr>]], 'FZF: Files')
        map('n', '<C-i>', [[:FzfLua live_grep<cr>]], 'FZF: Live grep')
    end
}
