-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == "" then
        current_dir = cwd
    else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        print("Not a git repository. Searching on current working directory")
        return cwd
    end
    return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
        require("telescope.builtin").live_grep({
            search_dirs = { git_root },
        })
    end
end

local init = function()
    -- Enable telescope fzf native, if installed
    -- l
    pcall(require("telescope").load_extension, "fzf")
    local telescope = require("telescope")
    telescope.load_extension("project")
    local utils = require("telescope.utils")

    local actions = require("telescope.actions")
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                    ["<esc>"] = actions.close,
                    ["<C-k>"] = function()
                        vim.cmd("stopinsert")
                    end,
                },
                n = {
                    ["<C-k>"] = function()
                        vim.cmd(":normal k")
                    end,
                    ["-"] = actions.select_horizontal,
                    ["|"] = actions.select_vertical,
                },
            },
        },
    })

    vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
    vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>s?", require("telescope.builtin").help_tags, { desc = "[S]earch help" })
    vim.keymap.set("n", "<leader>sf", require("telescope.builtin").git_files, { desc = "[S]earch Git [F]iles" })
    vim.keymap.set("n", "<leader>sh", function()
        require("telescope.builtin").find_files({ cwd = utils.buffer_dir() })
    end, { desc = "[S]earch files [H]ere" })
    vim.keymap.set(
        "n",
        "<leader>ss",
        require("telescope.builtin").treesitter,
        { desc = "[S]earch [S]ymbols from Treesitter" }
    )
    vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>si", ":LiveGrepGitRoot<cr>", { desc = "[S]earch [I]side files" })
    vim.keymap.set("n", "<leader>sI", function()
        require("telescope.builtin").live_grep({ cwd = utils.buffer_dir() })
    end, { desc = "[S]earch [I]side files at current buffer location" })
    vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>sp", require("telescope").extensions.project.project, { desc = "[S]earch [P]rojects" })
    vim.keymap.set("n", "<leader>sgc", require("telescope.builtin").git_commits, { desc = "[S]earch [G]it [C]ommits" })
    vim.keymap.set(
        "n",
        "<leader>sgf",
        require("telescope.builtin").git_bcommits,
        { desc = "[S]earch [G]it commits for [File]" }
    )
    vim.keymap.set("n", "<leader>sq", require("telescope.builtin").quickfix, { desc = "[S]earch [Q]uickfix list" })
    vim.keymap.set("n", "<leader>sj", require("telescope.builtin").jumplist, { desc = "[S]earch [J]umplist" })
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-tree/nvim-web-devicons",
    },
    init = init,
}
