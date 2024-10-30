local M = {}

M.nmap = function(keys, func, desc) -- normal mode
    vim.keymap.set("n", keys, func, { noremap = true, silent = true, desc = desc })
end

M.vmap = function(keys, func, desc) --visual mode
    vim.keymap.set("v", keys, func, { noremap = true, silent = true, desc = desc })
end

M.imap = function(keys, func, desc) --insert mode
    vim.keymap.set("i", keys, func, { noremap = true, silent = true, desc = desc })
end

return M
