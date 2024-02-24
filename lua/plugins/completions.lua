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

return {
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
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
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
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<C-b>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
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
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            fallback()
                        end
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
}
