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

    { 'nvim-lualine/lualine.nvim', config = true },

    {
	'nvim-neotest/neotest',
	dependencies = {
	    'nvim-neotest/nvim-nio',
	    'nvim-lua/plenary.nvim',
	    'nvim-neotest/nvim-nio',
	    'nvim-treesitter/nvim-treesitter',
	    'antoinemadec/FixCursorHold.nvim',
	    'nvim-treesitter/nvim-treesitter',
	    'marilari88/neotest-vitest',
	},
	config = function()
	    local neotest = require('neotest')
	    neotest.setup({
		adapters = {
		    require('neotest-vitest')
		}
	    })

	    vim.keymap.set("n", "<leader>tc", function()
		neotest.run.run()
	    end)

	    vim.keymap.set("n", "<leader>tf", function()
		neotest.run.run(vim.fn.expand("%"))
	    end)
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

    --[[ {
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
    }, ]]

    {
	'davidgranstrom/nvim-markdown-preview',
    }
}


