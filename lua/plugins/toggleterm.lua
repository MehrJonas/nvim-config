return {
  "akinsho/toggleterm.nvim",
  init = function()
    require("toggleterm").setup({open_mapping = [[<C-t>]]})
  end
}

