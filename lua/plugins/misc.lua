return {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "michaeljsmith/vim-indent-object",
  "rhysd/clever-f.vim",
  {
    "lewis6991/impatient.nvim",
    init = function()
      require("impatient")
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup({})
  end
  }
}



