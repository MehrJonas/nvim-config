if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
    local function map(...)
        vim.api.nvim_buf_set_keymap(0, ...)
    end

    map(
        "n",
        "<CR>",
        "<Cmd>lua vim.lsp.buf.definition()<CR>",
        { noremap = true, silent = false, desc = "Open the link under the caret" }
    )

    map(
        "n",
        "<leader>zn",
        "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
        { noremap = true, silent = false, desc = "make a new [N]ote" }
    )

    map(
        "v",
        "<leader>znt",
        ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
        { noremap = true, silent = false, desc = "make a [N]ote with the current selection as the [T]itle" }
    )

    map(
        "v",
        "<leader>znc",
        ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
        { noremap = true, silent = false, desc = "make a [N]ote with the current selection as the [C]ontent" }
    )

    map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", { noremap = true, silent = false, desc = "show [B]acklinks" })

    map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", { noremap = true, silent = false, desc = "show [L]inks" })

    map(
        "n",
        "K",
        "<Cmd>lua vim.lsp.buf.hover()<CR>",
        { noremap = true, silent = false, desc = "Preview a linked note." }
    )

    map(
        "v",
        "<leader>za",
        ":'<,'>lua vim.lsp.buf.range_code_action()<CR>",
        { noremap = true, silent = false, desc = "Open the link under the caret" }
    )
end
