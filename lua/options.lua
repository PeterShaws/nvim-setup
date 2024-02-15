local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g

--[[ Basics ]]
cmd('filetype plugin on')            -- Enable filetype plugin
g.mapleader = ' '                    -- Set global <Leader> key
g.localleader = '\\'                 -- Set local <Leader> key
g.t_co = 256                         -- Enable 256-color support
g.background = "dark"                -- Enforce terminal background
opt.smartcase = true                 -- Use smartcase search

--[[ Context ]]
opt.colorcolumn = '80'               -- Show col for max line length
opt.number = true                    -- Show line numbers
opt.relativenumber = true            -- Show relative line numbers
opt.scrolloff = 4                    -- Min num lines of context
opt.signcolumn = 'yes'               -- Show the sign column

--[[ Filetypes ]]
opt.encoding = 'utf8'                -- String encoding to use
opt.fileencoding = 'utf8'            -- File encoding to use

--[[ Theme ]]
opt.syntax = 'ON'                    -- Allow syntax highlighting
opt.termguicolors = true             -- If term supports ui color then enable
cmd('hi ColorColumn guibg=#11151b')  -- Set 80-char ruler color
opt.fillchars = 'stl: '              -- Hide current status line fill char

--[[ Whitespace ]]
opt.expandtab = true                 -- Use spaces instead of tabs
opt.shiftwidth = 4                   -- Size of an indent
opt.softtabstop = 4                  -- Number of spaces tabs add in insert mode
opt.tabstop = 4                      -- Number of spaces tabs count for

--[[ Code ]]
opt.foldenable = false               -- Don't fold code by default

--[[ Splits ]]
opt.splitright = true                -- Place new window to the right of current one
opt.splitbelow = true                -- Place new window below the current one
