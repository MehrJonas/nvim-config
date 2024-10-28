local util = require("util")

vim.keymap.set("n", "<space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

util.nmap("<C-h>", "<C-w>h")
util.nmap("<C-j>", "<C-w>j")
util.nmap("<C-k>", "<C-w>k")
util.nmap("<C-l>", "<C-w>l")

util.nmap("P", '"+p', "[P]aste from system clipboard")
util.vmap("P", '"+p')
util.nmap("Y", '"+y', "[Y]ank from system clipboard")
util.vmap("Y", '"+y')
util.nmap("YY", '"+yy')

util.cmap("X", "xa")
util.cmap("W", "wa")
util.cmap("Q", "qa")
