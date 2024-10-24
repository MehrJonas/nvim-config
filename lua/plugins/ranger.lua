return {
    "kelly-lin/ranger.nvim",
    config = function()
        require("ranger-nvim").setup({
            replace_netrw = true,
            ui = {
                height = 0.8,
                width = 0.8,
                border = "single",
            },
        })
        vim.api.nvim_set_keymap("n", "<leader>rr", "", {
            noremap = true,
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })
    end,
}
