local map = vim.api.nvim_set_keymap

--[[ Insert mode convenience ]]
map('i', 'jk', '<Esc>', {})              -- Exit insert mode
map('i', '<A-h>', '<Left>', {})          -- Move cursor left
map('i', '<A-j>', '<Down>', {})          -- Move cursor down
map('i', '<A-k>', '<Up>', {})            -- Move cursor up
map('i', '<A-l>', '<Right>', {})         -- Move cursor right

--[[ Window navigation ]]
map('n', '<C-h>', '<C-w>h', {})          -- Focus window to the left
map('n', '<C-j>', '<C-w>j', {})          -- Focus window below
map('n', '<C-k>', '<C-w>k', {})          -- Focus window above
map('n', '<C-l>', '<C-w>l', {})          -- Focus window to the right
map('n', '<C-C>', '<C-w>c', {})          -- Close current window
map('n', '<Leader>h', [[:noh<CR>]], {})  -- Clear search highlight

--[[ Miscellaneous ]]
map('n', '<A-w>', [[:set wrap!]], {})    -- Toggle word wrap
