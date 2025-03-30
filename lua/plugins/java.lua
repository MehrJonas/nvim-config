return {
    "nvim-java/nvim-java",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    init = function()
        require("java").setup()
        require("lspconfig").jdtls.setup({})
    end,
}
