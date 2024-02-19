local function map(mode, keys, command, options)
    options = options or {}
    vim.keymap.set(mode, keys, command, options)
end

--[[ Insert mode navigation ]]
map('i', '<A-h>', '<left>')  -- move cursor left
map('i', '<A-j>', '<down>')  -- move cursor down
map('i', '<A-k>', '<up>')    -- move cursor up
map('i', '<A-l>', '<right>') -- move cursor right

--[[ Window navigation ]]
map('n', '<C-h>', '<C-w>h') -- focus window to the left
map('n', '<C-j>', '<C-w>j') -- focus window below
map('n', '<C-k>', '<C-w>k') -- focus window above
map('n', '<C-l>', '<C-w>l') -- focus window to the right
map('n', '<C-c>', '<C-w>c') -- close current window

--[[ Miscellaneous ]]
map('n', '<Leader>a', [[:Alpha<CR>]])                  -- Invoke dashboard panel
map('n', '<Leader>cd', [[:cd %:h<CR>]])                -- Change to the current file's directory
map('n', '<Leader>A', [[:keepjumps normal! ggVG<CR>]]) -- Select all text
map({ 'n', 'x' }, 'gy', '"+y')                         -- Copy to clipboard
map({ 'n', 'x' }, 'gp', '"+p')                         -- Paste from clipboard
map('n', '<Leader>w', [[:write<CR>]])                  -- Write the current file
map('n', '<Leader>qq', [[:qa!<CR>]])                   -- Quit NeoVim without saving anything
map('n', '<Leader>qw', [[:wqa<CR>]])                   -- Quit NeoVim, saving everything
map('n', '<F5>', [[:luafile %<CR>]])                   -- Source current lua file
map('n', '<A-w>', [[:set wrap!<CR>]])                  -- Toggle word wrap
map('n', '<Leader>h', [[:noh<CR>]])                    -- Clear search highlight
map('n', '<Leader>Q', [[:%s/"/'/g<CR>]])               -- Replace all double quotes
map('n', '<Leader>I', 'gg=G')                          -- Reindent file

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
