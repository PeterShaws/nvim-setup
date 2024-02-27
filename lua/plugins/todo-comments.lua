local u = require('user.utils')

return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local todo_comments = require('todo-comments')
        todo_comments.setup({
            keywords = { TEST = { icon = '' } }
        })
        u.map('n', ']t', function() todo_comments.jump_next() end, 'Next to-do comment')
        u.map('n', '[t', function() todo_comments.jump_prev() end, 'Previous to-do comment')
        u.map('n', '<Leader>xt', [[:TodoTrouble<CR>]], 'To-do list')
    end
}
