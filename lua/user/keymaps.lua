local function map(mode, lhs, rhs, desc)
    local opts = { desc = desc }
    vim.keymap.set(mode, lhs, rhs, opts)
end

--[[ Insert mode navigation ]]
map('i', '<A-h>', '<Left>', 'Move cursor left')
map('i', '<A-j>', '<Down>', 'Move cursor down')
map('i', '<A-k>', '<Up>', 'Move cursor up')
map('i', '<A-l>', '<Right>', 'Move cursor right')

--[[ Window navigation ]]
map('n', '<C-h>', '<C-w>h', 'Focus window to the left')
map('n', '<C-j>', '<C-w>j', 'Focus window below')
map('n', '<C-k>', '<C-w>k', 'Focus window above')
map('n', '<C-l>', '<C-w>l', 'Focus window to the right')
map('n', '<C-c>', '<C-w>c', 'Close current window')

--[[ Files/Buffers ]]
map('n', '<Leader>cd', [[:cd %:h<CR>]], 'Change to the current buffer’s directory')
map('n', '<Leader>ww', [[:write<CR>]], 'Write the current buffer')
map('n', '<Leader>wa', [[:wall<CR>]], 'Write all open buffers')
map('n', '<Leader>qa', [[:%bdelete!|Alpha|bdelete#|Neotree close<CR>]], 'Close all open buffers')
map('n', '<Leader>qq', [[:qa!<CR>]], 'Quit NeoVim without writing anything')
map('n', '<Leader>qw', [[:wqa<CR>]], 'Quit NeoVim, writing everything')
map('n', '<F5>', [[:echo "Lua file sourced."|luafile %<CR>]], 'Source current lua file')

--[[ Text ]]
map('n', '<Leader>A', [[:keepjumps normal! ggVG<CR>]], 'Select all text')
map({ 'n', 'x' }, 'gy', '"+y', 'Copy to clipboard')
map({ 'n', 'x' }, 'gp', '"+p', 'Paste from clipboard')
map({ 'n', 'x' }, 'x', '"_x', 'Delete')
map({ 'n', 'x' }, 'X', '"_d', 'Delete')
map('n', '<A-w>', [[:set wrap!<CR>]], 'Toggle word wrap')
map('n', '<Leader>Q', [[:%s/"/'/g<CR>]], 'Replace all double quotes')
map('n', '<Leader>I', 'gg=G', 'Reindent file')
map('n', '<Esc>', [[:noh<CR>]], 'Clear search highlight')

--[[ Autocommands ]]
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
