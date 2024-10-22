return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-sleuth",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "michaeljsmith/vim-indent-object",
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup({})
        end,
    },
}
