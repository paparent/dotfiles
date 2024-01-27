return {
	'nvim-treesitter/nvim-treesitter',
	build = function()
	    require('nvim-treesitter.install').update({ with_sync = true })()
	end,
	config = function()

      require'nvim-treesitter.configs'.setup({
        ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
      })
    end,
}
