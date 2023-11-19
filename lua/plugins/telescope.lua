local init = function()

end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
  },
  init = init
}

