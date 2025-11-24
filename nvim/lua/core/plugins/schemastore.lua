return {
    "b0o/schemastore.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        vim.lsp.config("jsonls", {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })

        vim.lsp.config("yamlls", {
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas({
                        extra = {
                            {
                                description = "Azure Pipelines",
                                fileMatch = ".workflows/*.yml",
                                name = "azure-pipelines",
                                url =
                                "https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json",
                            },
                        },
                    }),
                },
            },
        })
    end,
}
