return {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-repeat",
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
  }
}



