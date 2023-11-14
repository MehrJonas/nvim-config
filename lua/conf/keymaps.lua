local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local map = function(mode, new, old, opts_)
  if opts_ == nil then
    opts_ = opts
  end
  keymap(mode, new, old, opts_)
end

local nmap = function(new, old, opts_)
  map("n", new, old, opts)
end

local vmap = function(new, old, opts_)
  map("v", new, old, opts)
end



keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-h>", "<C-w>h")

vmap("<", "<gv")
vmap(">", ">gv")


