local map = require('user.utils').map

return {
    'tpope/vim-surround',
    config = function()
        -- Make Surround Leap-compatible
        map('n', 'gz', [[<Plug>Ysurround]], 'Get Surround')                    -- ys
        map('n', 'gZ', [[<Plug>YSurround]], 'Get Indented Surround')           -- yS
        map('n', 'gzr', [[<Plug>Csurround]], 'Get Surround Replaced')          -- cs
        map('n', 'gZr', [[<Plug>CSurround]], 'Get Indented Surround Replaced') -- cS
        map('n', 'gzd', [[<Plug>Dsurround]], 'Get Surround Deleted')           -- ds
        map('n', 'gzz', [[<Plug>Ysurround]], 'Get String Surround')            -- yss
        map('n', 'gZZ', [[<Plug>YSurround]], 'Get Indented String Surround')   -- ySs
        map('v', 'gz', [[<Plug>VSurround]], 'Visual Surround')                 -- S
        map('v', 'gZ', [[<Plug>VgSurround]], 'Visual Indented Surround')       -- gS
    end
}
