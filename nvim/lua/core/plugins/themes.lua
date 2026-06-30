return {

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        -- priority = 1000,
        config = function()
            require('kanagawa').setup({
                transparent = true,
            })
            -- vim.cmd("colorscheme kanagawa")
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = 'moon',
            })
            vim.cmd("colorscheme rose-pine")
        end,
    },

    {
        "neanias/everforest-nvim",
        verison = false,
        lazy = false,
        -- priority = 1000,
        config = function()
            require('everforest').setup({
                background = 'hard',
            })
            -- vim.cmd("colorscheme everforest")
        end,
    },

    -- {
    --     "sainnhe/gruvbox-material",
    --     lazy = false,
    --     init = function()
    --         vim.g.gruvbox_background = 'hard'
    --         vim.g.gruvbox_transparent_background = 1
    --         vim.g.gruvbox_enable_italic = 1
    --     end,
    -- },

}
