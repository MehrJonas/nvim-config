return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "windwp/nvim-ts-autotag",
        init = function()
            require("nvim-ts-autotag").setup()
        end
    }
}
