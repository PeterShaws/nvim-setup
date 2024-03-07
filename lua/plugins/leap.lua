local map = require('user.utils').map

return {
    'ggandor/leap.nvim',
    config = function()
        local leap = require('leap')
        -- The plugin function gives an unskippable warning if Surround
        -- is installed. Thus we set these manually.
        map({ 'n', 'x', 'o' }, 's', [[<Plug>(leap-forward)]], 'Leap forward')
        map({ 'n', 'x', 'o' }, 'S', [[<Plug>(leap-backward)]], 'Leap backward')
        map({ 'n', 'x', 'o' }, 'gs', [[<Plug>(leap-from-window)]], 'Leap from window')
        leap.opts.special_keys.prev_target = '<BS>'
        leap.opts.special_keys.prev_group = '<BS>'

        require('leap.user').set_repeat_keys('<CR>', '<BS>')
    end
}
