return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
        require("mini.statusline").setup()
        require("mini.pairs").setup()
        require("mini.cursorword").setup()
        require("mini.trailspace").setup()
    end,
}
