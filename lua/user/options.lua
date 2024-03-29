local cmd = vim.api.nvim_command
local opt = vim.opt

-- Basics
cmd('filetype plugin on') -- Enable filetype plugin
opt.ignorecase = true     -- Ignore case when searching
opt.smartcase = true      -- Use smartcase search
opt.showmode = false      -- Disable mode display in command line

-- Context
opt.colorcolumn = '80'    -- Show col for max line length
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.scrolloff = 4         -- Min num lines of context
opt.signcolumn = 'yes'    -- Show the sign column
opt.cursorline = true     -- Highlight the current line

-- Files
opt.encoding = 'utf8'     -- String encoding to use
opt.fileencoding = 'utf8' -- File encoding to use
opt.hidden = true         -- Allow hidden unsaved buffers

-- Theme
opt.fillchars = 'stl: ,fold: ' -- Hide current status line, fold fill chars
opt.listchars = 'tab:<->,trail:·,nbsp:○,extends:⏵,precedes:⏴,eol:¶'
opt.syntax = 'ON'        -- Allow syntax highlighting
opt.termguicolors = true -- If term supports ui color then enable

-- Whitespace
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4   -- Size of an indent
opt.softtabstop = 4  -- Number of spaces tabs add in insert mode
opt.tabstop = 4      -- Number of spaces tabs count for

-- Windows
opt.splitright = true -- Place new window to the right of current one
opt.splitbelow = true -- Place new window below the current one

-- Tools
opt.grepprg = 'rg --vimgrep --smart-case --follow'
