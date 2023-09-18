return {
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'tpope/vim-sleuth',
    { 'j-hui/fidget.nvim', tag = 'legacy', event = "LspAttach", config = true },

    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { {'nvim-lua/plenary.nvim'} } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
    { 'nvim-telescope/telescope-file-browser.nvim' },

    { 'nvim-lualine/lualine.nvim', config = true },

    {
	'nvim-neotest/neotest',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    'antoinemadec/FixCursorHold.nvim',
	    'marilari88/neotest-vitest',
	},
	config = function()
	    require('neotest').setup({
		adapters = {
		    require('neotest-vitest')
		}
	    })
	end
    },

    {
	'rebelot/kanagawa.nvim',
	config = function()
	    vim.cmd('colorscheme kanagawa')
	end
    },

    {
	'nvim-treesitter/nvim-treesitter',
	build = function()
	    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	    ts_update()
	end,
    },

    {
	'numToStr/Comment.nvim',
	config = function()
	    require('Comment').setup()
	end
    },

    {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	}
    },

    {
	'alexghergh/nvim-tmux-navigation',
	config = function()
	    require'nvim-tmux-navigation'.setup {
		disable_when_zoomed = true, -- defaults to false
		keybindings = {
		    left = "<C-h>",
		    down = "<C-j>",
		    up = "<C-k>",
		    right = "<C-l>",
		    last_active = "<C-\\>",
		    next = "<C-Space>",
		}
	    }
	end
    },

    {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
	    require'trouble'.setup{}
	end
    },

    {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	end,
	opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	}
    },

    {
	'davidgranstrom/nvim-markdown-preview',
    }
}


