local M = {}
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

M.map = function(mode, new, old, opts_)
  if opts_ == nil then
    opts_ = opts
  end
  keymap(mode, new, old, opts_)
end

M.nmap = function(new, old, opts_)
  M.map("n", new, old, opts)
end

M.vmap = function(new, old, opts_)
  M.map("v", new, old, opts)
end

return M
