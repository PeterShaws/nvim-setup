return {
    {
        'williamboman/mason.nvim',
        opts = {
            ui = {
                icons = {
                    package_installed   = '●',  -- '✓',
                    package_pending     = '◌',  -- '➜',
                    package_uninstalled = '○',  -- '✗'
                }
            }
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {}
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.bashls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.tsserver.setup({})

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<Leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<Leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })

            -- Sign icons
            local signs = { Error = '', Warn = '', Hint = '󰌶', Info = '' }
            for type, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Float borders
            local border = {
                {'╭', 'FloatBorder'},  -- '🭽' -- upper-left line
                {'─', 'FloatBorder'},  -- '▔' -- top line
                {'╮', 'FloatBorder'},  -- '🭾' -- upper-right line
                {'│', 'FloatBorder'},  -- '▕' -- right line
                {'╯', 'FloatBorder'},  -- '🭿' -- bottom-right line
                {'─', 'FloatBorder'},  -- '▁' -- bottom line
                {'╰', 'FloatBorder'},  -- '🭼' -- bottom-left line
                {'│', 'FloatBorder'},  -- '▏' -- left line
            }
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
        end
    }
}
