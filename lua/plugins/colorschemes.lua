return {
    {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('github_dark_default') -- default
        end,
    },
    {
        'gmr458/vscode_modern_theme.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('vscode_modern').setup({
                cursorline = true,
                transparent_background = false,
                nvim_tree_darker = true,
            })
        end,
    },
    {
        'loctvl842/monokai-pro.nvim',
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        'ayu-theme/ayu-vim',
        lazy = false,
        priority = 1000,
    },
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        'cocopon/iceberg.vim',
        lazy = false,
        priority = 1000,
    },
    {
        'liuchengxu/space-vim-dark',
        lazy = false,
        priority = 1000,
    }
}
