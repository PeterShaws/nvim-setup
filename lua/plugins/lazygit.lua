local u = require('user.utils')

return {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.g.lazygit_floating_window_scaling_factor = 0.92
        vim.g.lazygit_floating_window_winblend = 10
        u.map('n', '<F7>', [[:LazyGit<CR>]], 'Open LazyGit')
    end,
}
