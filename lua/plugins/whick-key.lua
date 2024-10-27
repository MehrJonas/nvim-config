local util = require("util")
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 500,
        spec = {
            --mappings go here
        },
    },
    init = function()
        util.nmap("<leader>h", function()
            require("which-key").show({ global = false })
        end, "[H]elp (whichkey)")
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons",
    },
}
