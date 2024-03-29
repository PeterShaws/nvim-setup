local map = require('user.utils').map

-- Leaders
vim.g.mapleader = ' '    -- Set global <Leader> key
vim.g.localleader = '\\' -- Set local <Leader> key

-- Insert mode navigation
map('i', '<A-h>', [[<Left>]], 'Move cursor left')
map('i', '<A-j>', [[<Down>]], 'Move cursor down')
map('i', '<A-k>', [[<Up>]], 'Move cursor up')
map('i', '<A-l>', [[<Right>]], 'Move cursor right')

-- Window navigation
map('n', '<C-c>', [[<C-w>c]], 'Close current window')
map('n', '<C-h>', [[<C-w>h]], 'Focus window to the left')
map('n', '<C-j>', [[<C-w>j]], 'Focus window below')
map('n', '<C-k>', [[<C-w>k]], 'Focus window above')
map('n', '<C-l>', [[<C-w>l]], 'Focus window to the right')
map('n', '<C-lt>', [[<C-w><]], 'Decrease window width')
map('n', '<C-gt>', [[<C-w>>]], 'Increase window width')
map('n', '<C-->', [[<C-w>-]], 'Decrease window height')
map('n', '<C-+>', [[<C-w>+]], 'Increase window height')

-- Files/Buffers
map('n', '<Leader>bd', [[:cd %:h<CR>]], 'Change to current buffer’s directory')
map('n', '<Leader>bw', [[:write<CR>]], 'Write the current buffer')
map('n', '<Leader>ba', [[:wall<CR>]], 'Write all open buffers')
map('n', '<Leader>qa', [[:%bdelete!|Alpha|bdelete#|Neotree close<CR>]], 'Close all open buffers')
map('n', '<Leader>qq', [[:qa!<CR>]], 'Quit Neovim without writing anything')
map('n', '<Leader>qw', [[:wqa<CR>]], 'Quit Neovim, writing everything')
map('n', '<F5>', [[:echo "Lua file sourced."|luafile %<CR>]], 'Source current lua file')

-- Text
map('n', '<Leader>A', [[:keepjumps normal! ggVG<CR>]], 'Select all text')
map({ 'n', 'x' }, 'gy', [["+y]], 'Copy to clipboard')
map({ 'n', 'x' }, 'gp', [["+p]], 'Paste from clipboard (after cursor)')
map({ 'n', 'x' }, 'gP', [["+P]], 'Paste from clipboard (before cursor)')
map('t', '<C-S-C>', [["+y]], 'Copy from terminal into clipboard')
map('t', '<C-S-V>', [["+p]], 'Paste from clipboard into terminal')
map({ 'n', 'x' }, 'x', [["_x]], 'Delete')
map({ 'n', 'x' }, 'X', [["_d]], 'Delete')
map('n', '<A-w>', [[:set wrap!<CR>]], 'Toggle word wrap')
map('n', '<A-P>', [[:set list!<CR>]], 'Toggle whitespace')
map('n', '<Leader>cq', [[:%s/"/'/g<CR>]], 'Double quotes to single')
map('n', '<Leader>cQ', [[:%s/'/"/g<CR>]], 'Single quotes to double')
map('n', '<Leader>ci', [[gg=G]], 'Reindent')
map('n', '<Esc>', [[:noh<CR>]], 'Clear search highlight')
map('n', '<Leader>cc', [[:set conceallevel=2<CR>]], 'Conceal')
map('n', '<Leader>cr', [[:set conceallevel=0<CR>]], 'Reveal')
