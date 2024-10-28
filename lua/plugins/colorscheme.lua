return {
    -- "navarasu/onedark.nvim",
    -- "bluz71/vim-nightfly-colors",
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("nordic")
        -- require("nordic").load()
    end,
}
