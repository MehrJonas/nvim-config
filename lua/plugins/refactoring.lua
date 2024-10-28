--TODO: some cunctionality here clashes with LSP
local function keymaps()
    vim.keymap.set("x", "<leader>re", function()
        require("refactoring").refactor("[E]xtract Function")
    end)
    vim.keymap.set("x", "<leader>rf", function()
        require("refactoring").refactor("Extract [F]unction To File")
    end)
    -- Extract function supports only visual mode
    vim.keymap.set("x", "<leader>rv", function()
        require("refactoring").refactor("Extract [V]ariable")
    end)
    -- Extract variable supports only visual mode
    vim.keymap.set("n", "<leader>rI", function()
        require("refactoring").refactor("[I]nline Function")
    end)
    -- Inline func supports only normal
    vim.keymap.set({ "n", "x" }, "<leader>ri", function()
        require("refactoring").refactor("[I]nline Variable")
    end)
    -- Inline var supports both normal and visual mode

    vim.keymap.set("n", "<leader>rb", function()
        require("refactoring").refactor("Extract [B]lock")
    end)
    vim.keymap.set("n", "<leader>rbf", function()
        require("refactoring").refactor("Extract [B]lock To [F]ile")
    end)
    -- Extract block supports only normal mode
    vim.keymap.set("n", "<leader>rn", ":IncRename ")
end

return {
    "smjonas/inc-rename.nvim",
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup()
        require("inc_rename").setup()
        keymaps()
    end,
}
