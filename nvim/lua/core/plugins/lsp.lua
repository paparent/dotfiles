return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        { "mason-org/mason-lspconfig.nvim" },
        { "j-hui/fidget.nvim", opts = {} },
        { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    config = function()
        require("mason").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                -- local client = vim.lsp.get_client_by_id(args.data.client_id)
                local nmap = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                end

                nmap("gd", require('telescope.builtin').lsp_definitions, "[G]oto [D]efinition")
                nmap("gr", require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
                nmap("gI", require('telescope.builtin').lsp_implementations, "[G]oto [I]mplementation")
                nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            end,
        })

        require("mason-lspconfig").setup({
            -- ensure_installed = { "lua_ls", "ts_ls", "vue_ls" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            -- ["ts_ls"] = function()
            --     local vue_language_server_path = require("mason-registry")
            --         .get_package("vue-language-server")
            --         :get_install_path() .. "/node_modules/@vue/language-server"
            --
            --     vim.lsp.config("ts_ls", {
            --         on_attach = on_attach,
            --         capabilities = capabilities,
            --         init_options = {
            --             plugins = {
            --                 {
            --                     name = "@vue/typescript-plugin",
            --                     location = vue_language_server_path,
            --                     languages = { "vue" },
            --                 },
            --             },
            --         },
            --         filetypes = { "typescript", "javascript", "vue" },
            --     })
            -- end,
            }
        })
    end,
}
