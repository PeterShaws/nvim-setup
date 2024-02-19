return {
    'voldikss/vim-floaterm',
    config = function()
        vim.keymap.set('n', '<F12>', [[:FloatermToggle<CR>]], {desc='Open floating terminal'})
    end,
}
