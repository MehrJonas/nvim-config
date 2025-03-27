local opts = {
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
        vim.keymap.set(
            "n",
            "<leader>gh",
            require("gitsigns").preview_hunk,
            { buffer = bufnr, desc = "Preview [G]it [H]unk" }
        )

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ "n", "v" }, "<leader>gn", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to [n]ext hunk" })

        vim.keymap.set({ "n", "v" }, "<leader>gN", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })

        vim.keymap.set({ "n", "v" }, "<leader>gs", gs.stage_hunk, { desc = "[s]tage / unstage hunk" })
        vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk, { desc = "[r]eset hunk" })
        vim.keymap.set({ "n", "v" }, "<leader>gb", gs.blame, { desc = "git [b]lame" })
        vim.keymap.set({ "n", "v" }, "<leader>gB", gs.blame_line, { desc = "git [b]lame for current line" })
    end,
}

return {
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "tpope/vim-fugitive",
        },
        opts = opts,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        config = true,
        init = function()
            vim.keymap.set({ "n", "v" }, "<leader>gg", require("neogit").open, { desc = "open neo[G]it" })
        end,
    },
}
