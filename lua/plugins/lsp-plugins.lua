vim.opt.updatetime = 400

local map = require('user.utils').map

local function highlight_symbol(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil or not client.supports_method('textDocument/documentHighlight') then
        return
    end

    local group = vim.api.nvim_create_augroup('highlight_symbol', { clear = false })

    vim.api.nvim_clear_autocmds({ buffer = event.buf, group = group })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = group,
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
    })
end

return {
    {
        'williamboman/mason.nvim',
        opts = {
            ui = {
                border = 'rounded',
                icons = {
                    package_installed   = '●', -- '✓',
                    package_pending     = '◌', -- '➜',
                    package_uninstalled = '○', -- '✗'
                },
            },
        },
    },
    { 'williamboman/mason-lspconfig.nvim', opts = {} },
    { 'folke/neodev.nvim',                 opts = {} },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'nvimdev/lspsaga.nvim',
                dependencies = {
                    'nvim-treesitter/nvim-treesitter',
                    'nvim-tree/nvim-web-devicons'
                },
                opts = {
                    ui = {
                        code_action = '󱠂',
                        lines = { '╰', '├', '│', '─', '╭' }
                    },
                    symbol_in_winbar = {
                        separator = '  '
                    }
                }
            }
        },
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- TODO: Improve this
            lspconfig.bashls.setup({ capabilities = lsp_capabilities })
            lspconfig.pyright.setup({ capabilities = lsp_capabilities })
            lspconfig.jsonls.setup({ capabilities = lsp_capabilities })
            lspconfig.tsserver.setup({ capabilities = lsp_capabilities })
            lspconfig.marksman.setup({ capabilities = lsp_capabilities })
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            map('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
            map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
            map('n', '<Leader>e', vim.diagnostic.open_float, 'Show diagnostic')
            map('n', '<Leader>E', vim.diagnostic.setloclist, 'Open diagnostics list')

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(event)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Local buffer mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local bmap = function(mode, key, handler, desc)
                        map(mode, key, handler, desc, { buffer = event.buf })
                    end

                    local buf = vim.lsp.buf
                    local builtin = require('telescope.builtin')

                    bmap('n', '<Leader>lr', buf.rename, 'Rename symbol')
                    bmap({ 'n', 'v' }, '<Leader>ca', buf.code_action, 'Code actions')
                    bmap('n', '<Leader>lc', [[:Lspsaga code_action<CR>]], 'Code actions')
                    bmap('n', '<Leader>lp', [[:Lspsaga peek_definition<CR>]], 'Peek definition')
                    bmap('n', '<Leader>lP', [[:Lspsaga peek_type_definition<CR>]], 'Peek type definition')
                    bmap('n', '<Leader>lg', [[:Lspsaga goto_definition<CR>]], 'Go to definition')
                    bmap('n', '<Leader>lG', [[:Lspsaga goto_type_definition<CR>]], 'Go to type definition')
                    bmap('n', '<Leader>lh', [[:Lspsaga incoming_calls<CR>]], 'Incoming calls')
                    bmap('n', '<Leader>lH', [[:Lspsaga outgoing_calls<CR>]], 'Outgoing calls')
                    bmap('n', '<Leader>lF', [[:Lspsaga finder<CR>]], 'Find references')
                    bmap('n', '<Leader>lo', [[:Lspsaga outline<CR>]], 'Outline')
                    bmap('n', '<Leader>ld', builtin.lsp_definitions, 'Definition')
                    bmap('n', '<Leader>lR', builtin.lsp_references, 'References')
                    bmap('n', '<Leader>li', builtin.lsp_implementations, 'Implementations')
                    bmap('n', '<Leader>lD', builtin.lsp_type_definitions, 'Type definition')
                    bmap('n', '<Leader>ls', builtin.lsp_document_symbols, 'Document Symbols')
                    bmap('n', '<Leader>lw', builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
                    bmap('n', '<Leader>lf', function() buf.format({ timeout_ms = 5000 }) end, 'Format Buffer')
                    bmap('n', 'K', buf.hover, 'Hover documentation')
                    bmap('n', '<C-k>', buf.signature_help, 'Signature documentation')
                    bmap('n', 'gD', buf.declaration, 'Go to declaration')
                    bmap('n', '<Leader>wf', buf.add_workspace_folder, 'Add workspace folder')
                    bmap('n', '<Leader>wr', buf.remove_workspace_folder, 'Remove workspace folder')
                    bmap('n', '<Leader>wl', function() print(vim.inspect(buf.list_workspace_folders())) end,
                        'List workspace folders')

                    highlight_symbol(event)
                end,
            })

            -- Sign icons
            local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
            for type, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Diagnostics display
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = { border = 'rounded', source = 'always' },
            })

            -- Float borders
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover,
                { border = 'rounded' }
            )
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help,
                { border = 'rounded' }
            )
        end,
    },
    { 'folke/lsp-colors.nvim' },
}
