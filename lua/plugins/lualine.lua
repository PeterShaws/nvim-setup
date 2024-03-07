return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = 'auto',
            section_separators = '',
            component_separators = ' ▏',
            disabled_filetypes = {
                statusline = { 'neo-tree', 'alpha', 'sagaoutline' },
            },
        },
    },
}
