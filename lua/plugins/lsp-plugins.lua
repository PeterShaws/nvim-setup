vim.opt.updatetime = 400

local map = function(keys, command, desc)
    vim.keymap.set('n', keys, command, { desc = desc })
end

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
            map('[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
            map(']d', vim.diagnostic.goto_next, 'Next diagnostic')
            map('<Leader>e', vim.diagnostic.open_float, 'Show diagnostic')
            map('<Leader>E', vim.diagnostic.setloclist, 'Open diagnostics list')

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local bmap = function(mode, key, handler, opts)
                        opts = opts or {}
                        opts.buffer = ev.buf
                        vim.keymap.set(mode, key, handler, opts)
                    end
                    local buf = vim.lsp.buf

                    bmap('n', 'gD', buf.declaration, { desc = 'Go to declaration' })
                    bmap('n', 'gd', buf.definition, { desc = 'Go to definition' })
                    bmap('n', 'K', buf.hover, { desc = 'Hover' })
                    bmap('n', 'gi', buf.implementation, { desc = 'Go to implementation' })
                    bmap('n', '<C-k>', buf.signature_help, { desc = 'Show signature' })
                    bmap('n', '<Leader>wf', buf.add_workspace_folder, { desc = 'Add workspace folder' })
                    bmap('n', '<Leader>wr', buf.remove_workspace_folder, { desc = 'Remove workspace folder' })
                    bmap('n', '<Leader>wl', function() print(vim.inspect(buf.list_workspace_folders())) end,
                        { desc = 'List workspace folders' })
                    bmap('n', '<Leader>D', buf.type_definition, { desc = 'Go to type definition' })
                    bmap('n', '<Leader>rn', buf.rename, { desc = 'Rename' })
                    bmap({ 'n', 'v' }, '<Leader>ca', buf.code_action, { desc = 'Code actions' })
                    bmap('n', 'gr', buf.references, { desc = 'List references' })
                    bmap('n', '<Leader>cf', buf.format, { desc = 'Format buffer' })

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
