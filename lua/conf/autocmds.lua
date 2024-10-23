local autosave_augroup = vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd({ "BufLeave" }, {
    group = autosave_augroup,
    callback = function()
        local current_buffer = vim.api.nvim_get_current_buf()
        local is_modified = vim.api.nvim_buf_get_option(current_buffer, "modified")
        local buftype = vim.api.nvim_buf_get_option(current_buffer, "buftype")
        local is_buftype_unset = buftype == nil or buftype == ""
        if is_buftype_unset and is_modified then
            vim.cmd("do BufWritePre")
            vim.cmd("w")
        end
    end,
})
