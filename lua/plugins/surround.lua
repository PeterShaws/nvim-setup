local u = require('user.utils')

return {
    'tpope/vim-surround',
    config = function()
        -- Make Surround Leap-compatible
        u.map('n', 'gz', [[<Plug>Ysurround]], 'Get Surround')                    -- ys
        u.map('n', 'gZ', [[<Plug>YSurround]], 'Get Indented Surround')           -- yS
        u.map('n', 'gzr', [[<Plug>Csurround]], 'Get Surround Replaced')          -- cs
        u.map('n', 'gZr', [[<Plug>CSurround]], 'Get Indented Surround Replaced') -- cS
        u.map('n', 'gzd', [[<Plug>Dsurround]], 'Get Surround Deleted')           -- ds
        u.map('n', 'gzz', [[<Plug>Ysurround]], 'Get String Surround')            -- yss
        u.map('n', 'gZZ', [[<Plug>YSurround]], 'Get Indented String Surround')   -- ySs
        u.map('v', 'gz', [[<Plug>VSurround]], 'Visual Surround')                 -- S
        u.map('v', 'gZ', [[<Plug>VgSurround]], 'Visual Indented Surround')       -- gS
    end
}
