local util = require("util")

vim.keymap.set("n", "<space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>rr", "<Nop>", { noremap = true, silent = true })

util.nmap("<C-h>", "<C-w>h")
util.nmap("<C-j>", "<C-w>j")
util.nmap("<C-k>", "<C-w>k")
util.nmap("<C-l>", "<C-w>l")

util.nmap("P", '"+p', "[P]aste from system clipboard")
util.vmap("P", '"+p')
util.nmap("Y", '"+y', "[Y]ank to system clipboard")
util.vmap("Y", '"+y')
util.nmap("YY", '"+yy')

vim.cmd(":ca X xa")
vim.cmd(":ca w wa")
vim.cmd(":ca Q qa")
