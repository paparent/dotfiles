return {
    'tpope/vim-sleuth',

    {
	'mbbill/undotree',
	config = function()
	    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end
    },

    {
	'tpope/vim-fugitive',
	config = function()
	    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end,
    },
    {
	'lewis6991/gitsigns.nvim',
	config = function()
	    require('gitsigns').setup({
		current_line_blame = true,
	    })
	end,
    },

    { 'j-hui/fidget.nvim', tag = 'legacy', event = "LspAttach", config = true },

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
	'numToStr/Comment.nvim',
	config = function()
	    require('Comment').setup()
	end
    },

    --[[
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
    ]]

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
	    local t = require'trouble'
	    t.setup{}
	    vim.keymap.set("n", "<leader>xx", function() t.open() end)
	    vim.keymap.set("n", "<leader>xw", function() t.open("workspace_diagnostics") end)
	    vim.keymap.set("n", "<leader>xd", function() t.open("document_diagnostics") end)
	    vim.keymap.set("n", "<leader>xl", function() t.open("quickfix") end)
	    vim.keymap.set("n", "<leader>xq", function() t.open("loclist") end)
	    vim.keymap.set("n", "gR", function() t.open("lsp_references") end)
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


