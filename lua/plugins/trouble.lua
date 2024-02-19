return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local map = vim.keymap.set
        map('n', '<Leader>xx', [[:TroubleToggle<CR>]], { desc = 'Toggle Trouble' })
        map('n', '<Leader>xw', [[:TroubleToggle workspace_diagnostics<CR>]], { desc = 'Workspace diagnostics' })
        map('n', '<Leader>xd', [[:TroubleToggle document_diagnostics<CR>]], { desc = 'Document diagnostics' })
        map('n', '<Leader>xq', [[:TroubleToggle quickfix<CR>]], { desc = 'Quickfix' })
        map('n', '<Leader>xl', [[:TroubleToggle loclist<CR>]], { desc = 'Location list' })
        map('n', '<Leader>xr', [[:TroubleToggle lsp_references<CR>]], { desc = 'LSP References' })
    end
}
