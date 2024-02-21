local map = function(keys, handler, desc)
    vim.keymap.set('n', keys, handler, { desc = desc })
end

return {
    'tpope/vim-surround',
    config = function()
        -- Make Surround Leap-compatible
        map('gz', [[<Plug>Ysurround]], 'Get Surround')                    -- ys
        map('gZ', [[<Plug>YSurround]], 'Get Indented Surround')           -- yS
        map('gzr', [[<Plug>Csurround]], 'Get Surround Replaced')          -- cs
        map('gZr', [[<Plug>CSurround]], 'Get Indented Surround Replaced') -- cS
        map('gzd', [[<Plug>Dsurround]], 'Get Surround Deleted')           -- ds
        map('gzz', [[<Plug>Ysurround]], 'Get String Surround')            -- yss
        map('gZZ', [[<Plug>YSurround]], 'Get Indented String Surround')   -- ySs
        map('gz', [[<Plug>VSurround]], 'Visual Surround')                 -- S
        map('gZ', [[<Plug>VgSurround]], 'Visual Indented Surround')       -- gS
    end
}
