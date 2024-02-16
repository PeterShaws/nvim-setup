local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

--[[ Insert mode convenience ]]
map('i', 'jk', '<esc>')      -- exit insert mode
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
map('n', '<Leader>a', [[:Alpha<CR>]])    -- Invoke dashboard panel
map('n', '<Leader>qq', [[:qa!<CR>]])     -- Quit NeoVim without saving anything
map('n', '<Leader>qw', [[:wqa<CR>]])     -- Quit NeoVim, saving everything
map('n', '<F5>', [[:luafile %<CR>]])     -- Source current lua file
map('n', '<A-w>', [[:set wrap!<CR>]])    -- toggle word wrap
map('n', '<Leader>h', [[:noh<CR>]])      -- Clear search highlight
map('n', '<Leader>Q', [[:%s/"/'/g<CR>]]) -- Replace all double quotes
map('n', '<Leader>I', 'gg=G')            -- Reindent file
