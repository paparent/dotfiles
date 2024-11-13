return {
    {
        'zbirenbaum/copilot-cmp',
        dependencies = {
            'zbirenbaum/copilot.lua',
        },
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })

            require('copilot_cmp').setup({})
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        build = "make tiktoken",
        opts = {
            --debug = true,
        },
    },
}
