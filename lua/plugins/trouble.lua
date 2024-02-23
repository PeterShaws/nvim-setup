local u = require('user.utils')

return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        u.map('n', '<Leader>xx', [[:TroubleToggle<CR>]], 'Toggle Trouble')
        u.map('n', '<Leader>xw', [[:TroubleToggle workspace_diagnostics<CR>]], 'Workspace diagnostics')
        u.map('n', '<Leader>xd', [[:TroubleToggle document_diagnostics<CR>]], 'Document diagnostics')
        u.map('n', '<Leader>xq', [[:TroubleToggle quickfix<CR>]], 'Quickfix')
        u.map('n', '<Leader>xl', [[:TroubleToggle loclist<CR>]], 'Location list')
        u.map('n', '<Leader>xr', [[:TroubleToggle lsp_references<CR>]], 'LSP References')
    end
}
