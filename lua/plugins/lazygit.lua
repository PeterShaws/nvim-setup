return {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.keymap.set('n', '<F7>', [[:LazyGit<CR>]], {desc='Open LazyGit'})
    end,
}
