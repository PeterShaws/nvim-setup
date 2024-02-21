local map = function(keys, command, desc)
    vim.keymap.set('n', keys, command, { desc = desc })
end
return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        map('<Leader>xx', [[:TroubleToggle<CR>]], 'Toggle Trouble')
        map('<Leader>xw', [[:TroubleToggle workspace_diagnostics<CR>]], 'Workspace diagnostics')
        map('<Leader>xd', [[:TroubleToggle document_diagnostics<CR>]], 'Document diagnostics')
        map('<Leader>xq', [[:TroubleToggle quickfix<CR>]], 'Quickfix')
        map('<Leader>xl', [[:TroubleToggle loclist<CR>]], 'Location list')
        map('<Leader>xr', [[:TroubleToggle lsp_references<CR>]], 'LSP References')
    end
}
