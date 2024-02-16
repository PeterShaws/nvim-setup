local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

--[[ Insert mode convenience ]]
map('i', 'jk', '<esc>')      -- exit insert mode
map('i', '<a-h>', '<left>')  -- move cursor left
map('i', '<a-j>', '<down>')  -- move cursor down
map('i', '<a-k>', '<up>')    -- move cursor up
map('i', '<a-l>', '<right>') -- move cursor right

--[[ Window navigation ]]
map('n', '<c-h>', '<c-w>h') -- focus window to the left
map('n', '<c-j>', '<c-w>j') -- focus window below
map('n', '<c-k>', '<c-w>k') -- focus window above
map('n', '<c-l>', '<c-w>l') -- focus window to the right
map('n', '<c-c>', '<c-w>c') -- close current window

--[[ Miscellaneous ]]
map('n', '<Leader>a', [[:Alpha<CR>]])    -- Invoke dashboard panel
map('n', '<F5>', [[:luafile %<CR>]])     -- Source current lua file
map('n', '<a-w>', [[:set wrap!]])        -- toggle word wrap
map('n', '<Leader>h', [[:noh<CR>]])      -- Clear search highlight
map('n', '<Leader>Q', [[:%s/"/'/g<CR>]]) -- Replace all double quotes
map('n', '<Leader>I', 'gg=G')            -- Reindent file
