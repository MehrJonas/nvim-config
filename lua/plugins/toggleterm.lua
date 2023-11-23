return {
  "akinsho/toggleterm.nvim",
  init = function()
    require("toggleterm").setup({open_mapping = [[<leader>t]]})
  end
}
