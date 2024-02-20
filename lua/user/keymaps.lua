local function map(mode, keys, command, options)
    options = options or {}
    vim.keymap.set(mode, keys, command, options)
end

--[[ Insert mode navigation ]]
map('i', '<A-h>', '<Left>', { desc = 'Move cursor left' })
map('i', '<A-j>', '<Down>', { desc = 'Move cursor down' })
map('i', '<A-k>', '<Up>', { desc = 'Move cursor up' })
map('i', '<A-l>', '<Right>', { desc = 'Move cursor right' })

--[[ Window navigation ]]
map('n', '<C-h>', '<C-w>h', { desc = 'Focus window to the left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus window below' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus window above' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus window to the right' })
map('n', '<C-c>', '<C-w>c', { desc = 'Close current window' })

--[[ Miscellaneous ]]
map('n', '<Leader>cd', [[:cd %:h<CR>]], { desc = 'Change to the current file’s directory' })
map('n', '<Leader>A', [[:keepjumps normal! ggVG<CR>]], { desc = 'Select all text' })
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to clipboard' })
map({ 'n', 'x' }, 'gp', '"+p', { desc = 'Paste from clipboard' })
map('n', '<Leader>ww', [[:write<CR>]], { desc = 'Write the current buffer' })
map('n', '<Leader>wa', [[:wall<CR>]], { desc = 'Write all open buffers' })
map('n', '<Leader>qa', [[:%bdelete!|Alpha|bdelete#|Neotree close<CR>]], { desc = 'Close all open buffers' })
map('n', '<Leader>qq', [[:qa!<CR>]], { desc = 'Quit NeoVim without writing anything' })
map('n', '<Leader>qw', [[:wqa<CR>]], { desc = 'Quit NeoVim, writing everything' })
map('n', '<F5>', [[:echo "Lua file sourced."|luafile %<CR>]], { desc = 'Source current lua file' })
map('n', '<A-w>', [[:set wrap!<CR>]], { desc = 'Toggle word wrap' })
map('n', '<Esc>', [[:noh<CR>]], { desc = 'Clear search highlight' })
map('n', '<Leader>Q', [[:%s/"/'/g<CR>]], { desc = 'Replace all double quotes' })
map('n', '<Leader>I', 'gg=G', { desc = 'Reindent file' })

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
