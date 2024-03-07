local map = require('user.utils').map

return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        map('n', '<Leader>xx', [[:TroubleToggle<CR>]], 'Toggle Trouble')
        map('n', '<Leader>xw', [[:TroubleToggle workspace_diagnostics<CR>]], 'Workspace diagnostics')
        map('n', '<Leader>xd', [[:TroubleToggle document_diagnostics<CR>]], 'Document diagnostics')
        map('n', '<Leader>xq', [[:TroubleToggle quickfix<CR>]], 'Quickfix')
        map('n', '<Leader>xl', [[:TroubleToggle loclist<CR>]], 'Location list')
        map('n', '<Leader>xr', [[:TroubleToggle lsp_references<CR>]], 'LSP References')
    end
}
