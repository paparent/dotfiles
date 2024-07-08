return {
    'neovim/nvim-lspconfig',
    dependencies = {
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{ 'j-hui/fidget.nvim', event = "LspAttach", config = true },
	{ 'folke/lazydev.nvim', ft = 'lua', opts = {} },
    },
    config = function()
	require('mason').setup()
	require('mason-lspconfig').setup({
	    ensure_installed = { 'lua_ls', 'tsserver', 'volar' }
	})

	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

	local on_attach  = function(_, bufnr)
	    local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	    end

	    nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
	    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	end

	require('mason-lspconfig').setup_handlers({
	    function (server_name)
		require('lspconfig')[server_name].setup({
		    on_attach = on_attach,
		    capabilities = capabilities,
		})
	    end,
	    ["tsserver"] = function()
		local vue_language_server_path = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

		require('lspconfig').tsserver.setup({
		    on_attach = on_attach,
		    capabilities = capabilities,
		    init_options = {
			plugins = {
			    {
				name = '@vue/typescript-plugin',
				location = vue_language_server_path,
				languages = {'vue' }
			    }
			},
		    },
		    filetypes = { 'typescript', 'javascript', 'vue' }
		})
	    end,
	})
    end
}
