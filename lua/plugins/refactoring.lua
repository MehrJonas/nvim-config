local function keymaps()
    vim.keymap.set("x", "<leader>re", function()
        require("refactoring").refactor("Extract Function")
    end, { desc = "[E]xtract Function" })
    vim.keymap.set("x", "<leader>rf", function()
        require("refactoring").refactor("Extract Function To File")
    end, { desc = "Extract [F]unction To File" })
    vim.keymap.set("x", "<leader>rv", function()
        require("refactoring").refactor("Extract Variable")
    end, { desc = "Extract [V]ariable" })
    vim.keymap.set("n", "<leader>rI", function()
        require("refactoring").refactor("Inline Function")
    end, { desc = "[I]nline Function" })
    vim.keymap.set({ "n", "x" }, "<leader>ri", function()
        require("refactoring").refactor("Inline Variable")
    end, { desc = "[I]nline Variable" })
    vim.keymap.set("n", "<leader>rb", function()
        require("refactoring").refactor("Extract Block")
    end, { desc = "Extract [B]lock" })
    vim.keymap.set("n", "<leader>rbf", function()
        require("refactoring").refactor("Extract Block To File")
    end, { desc = "Extract [B]lock To [F]ile" })
end

return {
    {
        "smjonas/inc-rename.nvim",
        init = function()
            require("inc_rename").setup({ cmd_name = "IncRename" })
            vim.keymap.set("n", "<leader>rn", function()
                return ":IncRename " .. vim.fn.expand("<cword>")
            end, { expr = true, desc = "[R]e[N]ame" })
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        init = keymaps(),
    },
}
