return {
    'neovim/nvim-lspconfig',
    dependencies = {
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{ 'j-hui/fidget.nvim', event = "LspAttach", config = true },
	'folke/neodev.nvim',
    },
    config = function()
	require('mason').setup()
	require('mason-lspconfig').setup({
	    ensure_installed = { 'lua_ls', 'tsserver' }
	})

	require('mason-lspconfig').setup_handlers({
	    function (server_name)
		require('lspconfig')[server_name].setup()
	    end,
	})
    end
}
