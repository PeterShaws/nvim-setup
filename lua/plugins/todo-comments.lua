local map = require('user.utils').map

return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local todo_comments = require('todo-comments')
        todo_comments.setup({
            keywords = { TEST = { icon = '' } }
        })
        map('n', ']t', function() todo_comments.jump_next() end, 'Next to-do comment')
        map('n', '[t', function() todo_comments.jump_prev() end, 'Previous to-do comment')
        map('n', '<Leader>xt', [[:TodoTrouble<CR>]], 'To-do list')
    end
}
