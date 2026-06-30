return {
    "nvim-mini/mini.nvim",
    version = false,
    priority = 100,
    config = function()
        require("mini.icons").setup()
        MiniIcons.mock_nvim_web_devicons()

        require("mini.statusline").setup()
        require("mini.pairs").setup()
        require("mini.cursorword").setup()
        require("mini.trailspace").setup()
        require("mini.surround").setup()
        require("mini.indentscope").setup()
    end,
}
