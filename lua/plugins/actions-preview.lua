return { -- TODO: use normal telescope config?
    "aznhe21/actions-preview.nvim",
    config = function()
        require("actions-preview").setup({
            backend = { "nui" },
            nui = {
                dir = "col",
                layout = {
                    relative = "cursor",
                    size = {
                        width = 70,
                        height = 10,
                    },
                    position = {
                        row = 1,
                        col = 0,
                    },
                },
                preview = {
                    size = 0,
                },
            },
        })
        vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)

        -- vim.keymap.set({ "v", "n" }, "<leader>ca", function()
        --     require("actions-preview").code_actions({ apply = true })
        -- end)
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}
