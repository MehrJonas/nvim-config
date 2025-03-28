return {
    "kelly-lin/ranger.nvim",
    config = function()
        local ranger_nvim = require("ranger-nvim")
        ranger_nvim.setup({
            replace_netrw = true,
            ui = {
                height = 0.8,
                width = 0.8,
                border = "single",
            },
            keybinds = {
                ["|"] = ranger_nvim.OPEN_MODE.vsplit,
                ["-"] = ranger_nvim.OPEN_MODE.split,
            },
        })
        vim.api.nvim_set_keymap("n", "<leader>er", "", {
            noremap = true,
            desc = "[E]xplore in [R]anger",
            callback = function()
                require("ranger-nvim").open(true)
            end,
        })
    end,
}
