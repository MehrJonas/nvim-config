return {
    "neovim/nvim-lspconfig",
    -- init = function()
    --     require("plugins.lsp.mason").setup()
    -- end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
}
