return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = 'auto',
            -- component_separators = '',
            -- section_separators = '',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = { 'neo-tree', 'alpha' },
                tabline = { 'neo-tree', 'alpha' },
                winbar = { 'neo-tree', 'alpha' },
            },
        },
    },
}
