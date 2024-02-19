return {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('github_dark_default')
        vim.cmd.highlight('ColorColumn guibg=#11151b')
    end,
}
