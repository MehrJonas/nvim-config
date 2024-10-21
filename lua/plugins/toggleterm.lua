return {
    "akinsho/toggleterm.nvim",
    init = function()
        require("toggleterm").setup({ open_mapping = [[<C-t>]] })

        local term_augroup = vim.api.nvim_create_augroup("term", { clear = true })

        vim.api.nvim_create_autocmd({ "TermOpen" }, {
            group = term_augroup,
            pattern = "term://*",
            callback = function()
                local opts = { buffer = 0 }
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
                vim.keymap.set("t", "<C->", [[<C-\>]], opts)
            end,
        })
    end,
}
