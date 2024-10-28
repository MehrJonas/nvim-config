local util = require("util")
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 500,
        spec = {
            { "<leader>g", group = "[G]it" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>c", group = "[C]ode / [C]omment" },
            { "<leader>r", group = "[R]efactor" },
            { "<leader>e", group = "[E]xplore files" },
            { "<leader>t", group = "[T]erminal" },
            { "<leader>n", group = "[N]avigate" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>w", group = "[W]orkspace" },
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
