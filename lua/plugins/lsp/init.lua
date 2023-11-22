return {
  "neovim/nvim-lspconfig",
  init = function()
    require("plugins.lsp.mason").setup()
    require("plugins.lsp.none_ls").setup()
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
  },
}
