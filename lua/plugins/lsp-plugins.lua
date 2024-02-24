vim.opt.updatetime = 400

local u = require('user.utils')

local servers = {
    bashls = {},
    pyright = {},
    jsonls = {},
    tsserver = {},
    marksman = {},
    lua_ls = {
        settings = {
            Lua = {
                completion = { callSnippet = 'Replace' },
                diagnostics = { globals = { 'vim' } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = { enable = false },
            }
        }
    }
}

local kind_icons = {
    Text = '',
    Method = '󰆧',
    Function = '󰊕',
    Constructor = '',
    Field = '󰇽',
    Variable = '󰂡',
    Class = '󰠱',
    Interface = '',
    Module = '',
    Property = '󰜢',
    Unit = '',
    Value = '󰎠',
    Enum = '',
    Keyword = '󰌋',
    Snippet = '',
    Color = '󰏘',
    File = '󰈙',
    Reference = '',
    Folder = '󰉋',
    EnumMember = '',
    Constant = '󰏿',
    Struct = '',
    Event = '',
    Operator = '󰆕',
    TypeParameter = '󰅲',
}

local highlight_symbols = function(bufnr)
    local group = vim.api.nvim_create_augroup('highlight_symbol', { clear = false })

    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
    })
end

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Local buffer mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local map = function(mode, key, handler, desc)
        if desc then desc = 'LSP: ' .. desc end
        vim.keymap.set(mode, key, handler, {
            buffer = bufnr, desc = desc, silent = true
        })
    end

    local buf = vim.lsp.buf
    local builtin = require('telescope.builtin')

    map('n', '<Leader>rn', buf.rename, 'Rename')
    map({ 'n', 'v' }, '<Leader>ca', buf.code_action, 'Code actions')
    map('n', '<Leader>ld', builtin.lsp_definitions, 'Definition')
    map('n', '<Leader>lr', builtin.lsp_references, 'References')
    map('n', '<Leader>li', builtin.lsp_implementations, 'Implementations')
    map('n', '<Leader>lD', builtin.lsp_type_definitions, 'Type Definitions')
    map('n', '<Leader>ls', builtin.lsp_document_symbols, 'Document Symbols')
    map('n', '<Leader>lw', builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
    map('n', 'K', buf.hover, 'Hover Documentation')
    map('n', '<C-k>', buf.signature_help, 'Signature Documentation')
    map('n', 'gD', buf.declaration, 'Go to declaration')
    map('n', '<Leader>wa', buf.add_workspace_folder, 'Add Workspace Folder')
    map('n', '<Leader>wr', buf.remove_workspace_folder, 'Remove Workspace Folder')
    map('n', '<Leader>wl', function() print(vim.inspect(buf.list_workspace_folders())) end, 'List Workspace Folders')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        buf.format()
    end, { desc = 'Format current buffer with LSP' })
    map('n', '<Leader>bf', [[:Format<CR>]], 'Format buffer')

    highlight_symbols(bufnr)
end

return {
    { 'folke/neodev.nvim',    opts = {} },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp', keyword_length = 1 },
                    { name = 'buffer',   keyword_length = 3 },
                    { name = 'luasnip',  keyword_length = 2 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = '󰘧',
                            nvim_lua = '',
                            luasnip = '',
                            buffer = '',
                            path = '',
                            latex_symbols = '',
                        }
                        item.kind = string.format('%s %s', kind_icons[item.kind], item.kind)
                        item.menu = menu_icon[entry.source.name] or entry.source.name
                        return item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
                    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-f>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
                    end, { 'i', 's' }),
                    ['<C-b>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
                    end, { 'i', 's' }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1
                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_prev_item(select_opts) else fallback() end
                    end, { 'i', 's' })
                }),
            })

            local highlight = vim.api.nvim_set_hl
            -- gray
            highlight(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
            -- blue
            highlight(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
            highlight(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
            -- light blue
            highlight(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
            highlight(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
            highlight(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
            -- pink
            highlight(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
            highlight(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
            -- front
            highlight(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
            highlight(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
            highlight(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
        end,
    },
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
    { 'williamboman/mason-lspconfig.nvim',opts={} },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            local mason_lspconfig = require('mason-lspconfig')

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers)
            })
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes
                    })
                end
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
