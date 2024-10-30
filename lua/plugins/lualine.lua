local function recording_macro()
    local reg = vim.fn.reg_recording()
    if reg == "" then
        return ""
    end
    return "recording @" .. reg
end

return {
    "nvim-lualine/lualine.nvim",
    config = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "nord",
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { recording_macro, "searchcount", "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
}
