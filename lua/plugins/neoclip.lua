return {
    "AckslD/nvim-neoclip.lua",
    opts = {
        default_register = { '"', "+", "*" },
        keys = {
            telescope = {
                i = { paste_behind = "<insert>" },
                n = {
                    paste = { "p", "<cr>" },
                    select = "y",
                    replay = "<cr>",
                },
            },
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>p", function()
            require("telescope").extensions.neoclip.default()
        end, { desc = "search and [p]aste from yank history" })
        vim.keymap.set("n", "<leader>q", function()
            require("telescope").extensions.macroscope.default()
        end, { desc = "search through macro history" })
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
}
