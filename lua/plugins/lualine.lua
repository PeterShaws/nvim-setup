return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = 'iceberg',
            component_separators = '⁞',
            section_separators = '',
            disabled_filetypes = {
                statusline = { 'neo-tree' },
            },
        },
    },
}
