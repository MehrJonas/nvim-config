return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        view = {
            width = 70,
        },
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set("n", "^", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "|", api.node.open.vertical, opts("vertical split"))
            vim.keymap.set("n", "-", api.node.open.horizontal, opts("horizontal split"))
        end,
    },
    init = function()
        vim.keymap.set("n", "<leader>et", function()
            vim.cmd(":NvimTreeToggle")
        end, { desc = "[E]xplore [T]ree" })
    end,
}
