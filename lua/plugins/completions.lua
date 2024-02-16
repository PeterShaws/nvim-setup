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
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        vim_item.menu = ({
                            buffer = '[Buffer]',
                            nvim_lsp = '[LSP]',
                            luasnip = '[LuaSnip]',
                            nvim_lua = '[Lua]',
                            latex_symbols = '[LaTeX]',
                        })[entry.source.name] or entry.source.name
                        return vim_item
                    end,
                },
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
