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

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("mason-lspconfig").setup({
            -- ensure_installed = { "lua_ls", "ts_ls", "vue_ls" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            }
        })

        vim.lsp.config('vue_ls', {})
        vim.lsp.config('ts_ls', {
            init_options = {
                plugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vim.fn.stdpath('data') ..
                            "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                        languages = { 'vue' },
                        configNamespace = 'typescript',
                    },
                },
            },
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        })
    end,
}
