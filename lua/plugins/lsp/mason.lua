local M = {}

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>cd", vim.diagnostic.open_float, "[C]ode [D]iagnostics")
    -- nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("<leader>nd", require("telescope.builtin").lsp_definitions, "[N]avigate to [D]efinition")
    nmap("<leader>nr", require("telescope.builtin").lsp_references, "[N]avigate to [R]eferences")
    nmap("<leader>ni", require("telescope.builtin").lsp_implementations, "[N]avigate to [I]mplementation")
    nmap("<leader>nci", require("telescope.builtin").lsp_incoming_calls, "[N]avigate [C]alls: [I]ncoming")
    nmap("<leader>nco", require("telescope.builtin").lsp_outgoing_calls, "[N]avigate [C]alls: [O]utgoing")
    nmap("<leader>nt", require("telescope.builtin").lsp_type_definitions, "[N]avigate to [T]ype definition")
    nmap("<leader>nds", require("telescope.builtin").lsp_document_symbols, "[N]avigate to [D]ocument [S]ymbols")
    nmap(
        "<leader>nws",
        require("telescope.builtin").lsp_dynamic_workspace_symbols,
        "[N]avigate to [W]orkspace [S]ymbols"
    )

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("<leader>nD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
end

M.setup = function()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup()
    local servers = {
        lua_ls = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "html", "css_variables", "somesass_ls", "cssls", "angularls", "ts_ls" },
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
            })
        end,
    })
end

return M
