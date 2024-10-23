return { -- TODO: use nurmal telescope config?
    "aznhe21/actions-preview.nvim",
    config = function()
        require("actions-preview").setup({
            backend = { "telescope" },
            telescope = vim.tbl_extend(
                "force",
                require("telescope.themes").get_cursor(),
                { make_value = nil, make_make_display = nil }
            ),
        })
        vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
}
