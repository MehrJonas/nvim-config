return {
    "AkslD/nvim-neoclip.lua",
    init = function()
        require("neoclip").setup({ default_register = { '"', "+", "*" } })
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
