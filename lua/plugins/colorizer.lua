return {
    "norcalli/nvim-colorizer.lua",
    init = function()
        require("colorizer").setup({
            "css",
            "scss",
            "javascript",
            css = { css = true },
            scss = { css = true },
        })
    end,
}