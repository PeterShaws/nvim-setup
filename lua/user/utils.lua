local M = {}

function M.map(mode, keys, handler, desc)
    vim.keymap.set(mode, keys, handler, { desc = desc, silent = true })
end

return M
