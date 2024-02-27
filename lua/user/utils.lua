--[[ Autocommands ]]
local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })

-- Quit help, man, and quickfix/location list windows with just <q>
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'man', 'qf' },
    group = augroup,
    desc = 'Use q to close the window',
    command = 'nnoremap <buffer> q <cmd>quit<CR>',
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    desc = 'Highlight on yank',
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end,
})

-- Set ColorColumn to an appropriate color from the current theme
vim.api.nvim_create_autocmd('ColorScheme', {
    group = augroup,
    desc = 'Set ColorColumn on changing colorschemes',
    callback = function()
        ---@diagnostic disable-next-line: undefined-field
        local hl = vim.api.nvim_get_hl_by_name('WinSeparator', true)
        vim.api.nvim_set_hl(0, 'ColorColumn', { bg = hl.foreground })
    end
})

-- Restore function of <CR> in quickfix and location lists
vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Restore function of <CR> in quickfix and location lists',
    group = augroup,
    callback = function(opts)
        if vim.bo[opts.buf].filetype == 'qf' then
            vim.keymap.set('n', '<CR>', '<CR>', { buffer = true, noremap = true })
        end
    end
})

--[[ Helper functions ]]
local M = {}

M.map = function(mode, keys, handler, desc)
    vim.keymap.set(mode, keys, handler, { desc = desc, silent = true })
end

return M
