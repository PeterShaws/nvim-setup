local u = require('user.utils')

-- Leaders
vim.g.mapleader = ' '    -- Set global <Leader> key
vim.g.localleader = '\\' -- Set local <Leader> key

-- Insert mode navigation
u.map('i', '<A-h>', [[<Left>]], 'Move cursor left')
u.map('i', '<A-j>', [[<Down>]], 'Move cursor down')
u.map('i', '<A-k>', [[<Up>]], 'Move cursor up')
u.map('i', '<A-l>', [[<Right>]], 'Move cursor right')

-- Window navigation
u.map('n', '<C-h>', [[<C-w>h]], 'Focus window to the left')
u.map('n', '<C-j>', [[<C-w>j]], 'Focus window below')
u.map('n', '<C-k>', [[<C-w>k]], 'Focus window above')
u.map('n', '<C-l>', [[<C-w>l]], 'Focus window to the right')
u.map('n', '<C-c>', [[<C-w>c]], 'Close current window')

-- Files/Buffers
u.map('n', '<Leader>bd', [[:cd %:h<CR>]], 'Change to current buffer’s directory')
u.map('n', '<Leader>bw', [[:write<CR>]], 'Write the current buffer')
u.map('n', '<Leader>ba', [[:wall<CR>]], 'Write all open buffers')
u.map('n', '<Leader>qa', [[:%bdelete!|Alpha|bdelete#|Neotree close<CR>]], 'Close all open buffers')
u.map('n', '<Leader>qq', [[:qa!<CR>]], 'Quit Neovim without writing anything')
u.map('n', '<Leader>qw', [[:wqa<CR>]], 'Quit Neovim, writing everything')
u.map('n', '<F5>', [[:echo "Lua file sourced."|luafile %<CR>]], 'Source current lua file')

-- Text
u.map('n', '<Leader>A', [[:keepjumps normal! ggVG<CR>]], 'Select all text')
u.map({ 'n', 'x' }, 'gy', [["+y]], 'Copy to clipboard')
u.map({ 'n', 'x' }, 'gp', [["+p]], 'Paste from clipboard (after cursor)')
u.map({ 'n', 'x' }, 'gP', [["+P]], 'Paste from clipboard (before cursor)')
u.map('t', '<C-S-C>', [["+y]], 'Copy from terminal into clipboard')
u.map('t', '<C-S-V>', [["+p]], 'Paste from clipboard into terminal')
u.map({ 'n', 'x' }, 'x', [["_x]], 'Delete')
u.map({ 'n', 'x' }, 'X', [["_d]], 'Delete')
u.map('n', '<A-w>', [[:set wrap!<CR>]], 'Toggle word wrap')
u.map('n', '<Leader>cq', [[:%s/"/'/g<CR>]], 'Double quotes to single')
u.map('n', '<Leader>cQ', [[:%s/'/"/g<CR>]], 'Single quotes to double')
u.map('n', '<Leader>ci', [[gg=G]], 'Reindent')
u.map('n', '<Esc>', [[:noh<CR>]], 'Clear search highlight')

-- Autocommands
local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })
-- Quit help and man windows with just <q>
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'man' },
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
