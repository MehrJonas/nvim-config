return {
    "zk-org/zk-nvim",
    config = function()
        require("zk").setup({
            picker = "telescope",
        })

        vim.api.nvim_set_keymap(
            "n",
            "<leader>zn",
            "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
            { noremap = true, silent = false, desc = "make a new [N]ote" }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>zo",
            "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
            { noremap = true, silent = false, desc = "[O]pen notes" }
        )

        -- Open notes associated with the selected tags.
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zt",
            "<Cmd>ZkTags<CR>",
            { noremap = true, silent = false, desc = "open notes by [T]ag" }
        )

        -- Search for the notes matching a given query.
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zf",
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
            { noremap = true, silent = false, desc = "[F]ind notes" }
        )
        -- Search for the notes matching the current visual selection.
        vim.api.nvim_set_keymap(
            "v",
            "<leader>zf",
            ":'<,'>ZkMatch<CR>",
            { noremap = true, silent = false, desc = "[F]ind notes" }
        )
    end,
}
