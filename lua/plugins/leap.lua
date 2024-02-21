local map = function(keys, command, desc)
    vim.keymap.set({ 'n', 'x', 'o' }, keys, command, { desc = desc })
end

return {
    'ggandor/leap.nvim',
    config = function()
        local leap = require('leap')
        --[[ leap.create_default_mappings() ]]
        -- The plugin function gives an unskippable warning if Surround
        -- is installed. Thus we set these manually.
        map('s', [[<Plug>(leap-forward)]], 'Leap forward')
        map('S', [[<Plug>(leap-backward)]], 'Leap backward')
        map('gs', [[<Plug>(leap-from-window)]], 'Leap from window')
        leap.opts.special_keys.prev_target = '<BS>'
        leap.opts.special_keys.prev_group = '<BS>'

        require('leap.user').set_repeat_keys('<CR>', '<BS>')
    end
}
