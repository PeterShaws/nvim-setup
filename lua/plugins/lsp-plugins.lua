vim.opt.updatetime = 400

local u = require('user.utils')

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
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

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
            u.map('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
            u.map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
            u.map('n', '<Leader>e', vim.diagnostic.open_float, 'Show diagnostic')
            u.map('n', '<Leader>E', vim.diagnostic.setloclist, 'Open diagnostics list')

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Local buffer mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local map = function(mode, key, handler, desc)
                        -- if desc then desc = 'LSP: ' .. desc end
                        vim.keymap.set(mode, key, handler, {
                            buffer = ev.buf, desc = desc, silent = true
                        })
                    end

                    local buf = vim.lsp.buf
                    local builtin = require('telescope.builtin')

                    map('n', '<Leader>rn', buf.rename, 'Rename')
                    map({ 'n', 'v' }, '<Leader>ca', buf.code_action, 'Code actions')
                    map('n', '<Leader>ld', builtin.lsp_definitions, 'Definition')
                    map('n', '<Leader>lr', builtin.lsp_references, 'References')
                    map('n', '<Leader>li', builtin.lsp_implementations, 'Implementations')
                    map('n', '<Leader>lD', builtin.lsp_type_definitions, 'Type Definition')
                    map('n', '<Leader>ls', builtin.lsp_document_symbols, 'Document Symbols')
                    map('n', '<Leader>lw', builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
                    map('n', '<Leader>lf', buf.format, 'Format Buffer')
                    map('n', 'K', buf.hover, 'Hover Documentation')
                    map('n', '<C-k>', buf.signature_help, 'Signature Documentation')
                    map('n', 'gD', buf.declaration, 'Go to declaration')
                    map('n', '<Leader>wf', buf.add_workspace_folder, 'Add Workspace Folder')
                    map('n', '<Leader>wr', buf.remove_workspace_folder, 'Remove workspace folder')
                    map('n', '<Leader>wl', function() print(vim.inspect(buf.list_workspace_folders())) end,
                        'List workspace folders')

                    highlight_symbol(ev)
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
