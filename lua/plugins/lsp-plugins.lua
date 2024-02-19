vim.opt.updatetime = 400

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
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {},
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup({ capabilities = lsp_capabilities })
            lspconfig.bashls.setup({ capabilities = lsp_capabilities })
            lspconfig.pyright.setup({ capabilities = lsp_capabilities })
            lspconfig.jsonls.setup({ capabilities = lsp_capabilities })
            lspconfig.tsserver.setup({ capabilities = lsp_capabilities })

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
            vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist,
                { desc = 'Add buffer diagnostics to the location list' })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local buf = vim.lsp.buf
                    local opts = table.unpack({ buffer = ev.buf })
                    local map = vim.keymap.set
                    map('n', 'gD', buf.declaration, { desc = 'Go to declaration', opts })
                    map('n', 'gd', buf.definition, { desc = 'Go to definition', opts })
                    map('n', 'K', buf.hover, { desc = 'Hover', opts })
                    map('n', 'gi', buf.implementation, { desc = 'Go to implementation', opts })
                    map('n', '<C-k>', buf.signature_help, { desc = 'Show signature', opts })
                    map('n', '<Leader>wf', buf.add_workspace_folder, { desc = 'Add workspace folder', opts })
                    map('n', '<Leader>wr', buf.remove_workspace_folder, { desc = 'Remove workspace folder', opts })
                    map('n', '<Leader>wl', function() print(vim.inspect(buf.list_workspace_folders())) end, { desc = 'List workspace folders', opts })
                    map('n', '<Leader>D', buf.type_definition, { desc = 'Go to type definition', opts })
                    map('n', '<Leader>rn', buf.rename, { desc = 'Rename', opts })
                    map({ 'n', 'v' }, '<Leader>ca', buf.code_action, { desc = 'Code actions', opts })
                    map('n', 'gr', buf.references, { desc = 'List references', opts })
                    map('n', '<Leader>f', function() buf.format({ async = true }) end, { desc = 'Format', opts })

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
