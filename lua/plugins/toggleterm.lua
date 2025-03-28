return {
    "akinsho/toggleterm.nvim",
    opts = {
        open_mapping = [[<leader>tt]],
        insert_mappings = false,
        terminal_mappings = false,
    },
    init = function()
        local term_augroup = vim.api.nvim_create_augroup("term", { clear = true })

        vim.api.nvim_create_autocmd({ "TermOpen" }, {
            group = term_augroup,
            pattern = "term://*",
            callback = function()
                local opts = { buffer = 0 }
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
                vim.keymap.set("t", "<C-<>", [[<C-\>]], opts)
                -- TODO is it possible to get tabbed terminals?
            end,
        })

        vim.api.nvim_create_autocmd({ "TermEnter" }, {
            group = term_augroup,
            pattern = "term://*",
            callback = function()
                local mode = vim.api.nvim_get_mode().mode
                if mode ~= "t" then
                    local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                    vim.api.nvim_feedkeys(keys, "A", true)
                end
            end,

        })

        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "double",
            },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end,

}
