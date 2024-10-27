return {
    "AkslD/nvim-neoclip.lua",
    init = function()
        require("neoclip").setup({ default_register = { '"', "+", "*" } })
        vim.keymap.set("n", "<leader>p", function()
            require("telescope").extensions.neoclip.default()
        end)
        vim.keymap.set("n", "<leader>q", function()
            require("telescope").extensions.macroscope.default()
        end)
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
}
