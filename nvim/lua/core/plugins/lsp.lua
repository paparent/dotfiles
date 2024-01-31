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

	require('neodev').setup({})

	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

	local on_attach  = function(_, bufnr)
	    local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	    end

	    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	end

	require('mason-lspconfig').setup_handlers({
	    function (server_name)
		require('lspconfig')[server_name].setup({
		    on_attach = on_attach,
		    capabilities = capabilities,
		})
	    end,
	})
    end
}
